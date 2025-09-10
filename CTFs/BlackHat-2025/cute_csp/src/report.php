<?php
const URL_PREFIX =  "http://localhost:5000/index.php";

echo "<pre>";

$url = $_REQUEST['url'] ?? null;
if (isset($url) && str_starts_with($url, URL_PREFIX)) {
    $start_time = microtime(true);

    $url = escapeshellarg($url);
    system("python3 bot.py " . $url);

    echo "[xssbot] total request time: " . (microtime(true) - $start_time) . " seconds";
} else {
    echo "[!] Please provide a URL in the format ^" . URL_PREFIX . PHP_EOL;
}

echo "</pre>";
