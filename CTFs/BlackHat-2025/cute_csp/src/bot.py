import os
import sys
import asyncio
import traceback
from pathlib import Path
from playwright.async_api import async_playwright

BASE_URL = "http://localhost:5000"
ADMIN_TOKEN = os.getenv("ADMIN_TOKEN")
URL_PREFIX = "http://localhost:5000/index.php"

# makeshift lockfile, not safe against deliberate race conditions
LOCKFILE = Path("bot.lock")


async def visit(url: str):
    if LOCKFILE.exists():
        print("[xssbot] ongoing visit detected, cancelling...")
        exit(1)

    if not url.startswith(URL_PREFIX):
        print("[xssbot] invalid URL format")
        exit(1)

    try:
        Path(LOCKFILE).touch()
        print("[xssbot] visiting url")
        p = await async_playwright().start()

        browser = await p.chromium.launch(headless=True)
        context = await browser.new_context()

        await context.add_cookies(
            [
                {
                    "name": "token",
                    "value": ADMIN_TOKEN,
                    "domain": "localhost",
                    "httpOnly": True,
                    "path": "/",
                }
            ]
        )

        page = await context.new_page()

        await page.goto(url)
        await page.wait_for_load_state("networkidle")
        await page.wait_for_timeout(1_000)
        content = await page.evaluate("() => document.documentElement.innerHTML")
        print("-" * 32)
        print(content)
        print("-" * 32)

    except Exception:
        print("[xssbot] failed during visit:", traceback.format_exc())
    finally:
        LOCKFILE.unlink()
        print("[xssbot] complete")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("[!] Invalid argument length")
        exit(1)

    url = sys.argv[1]
    asyncio.run(visit(url))
