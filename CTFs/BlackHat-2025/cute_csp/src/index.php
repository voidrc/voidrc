<?php
header("Content-Security-Policy: default-src 'none'; style-src 'unsafe-inline; img-src *;");
@print($_GET["html"] ?? show_source(__FILE__));
