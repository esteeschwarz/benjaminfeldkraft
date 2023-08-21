<?php
include("../../assets/puller.php");
include("../../assets/benpull.php");

$src="index_h.html";
$file=fopen($src,"r");
$srcbyte=filesize($src);
$stat=stat($src);
echo fread($file,$srcbyte);
fclose($file);
?>