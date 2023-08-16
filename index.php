<?php

// $txt = $_REQUEST["title"]; //request-  mit q funktioniert, duck wird geschrieben
// $ref = $_REQUEST["ref"];
include("../../puller.php");
// include("../../mdpull-hulx.php");
include("../../benpull.php");


// $myfile = fopen("pings/pingdata.csv", "a+") or die("FUCT! I forgot to tie my shoes!");
// $force="\n";
// $open=$txt;
// $txt="public"; //page
// //$ref="0";
// $src=$open;
// $date=date("Ymd(H:i:s)");
// $write="$date,$txt,$ref\n";
// //$write=$date.",".$txt;
// fwrite($myfile, $write);
// //fwrite($myfile, $force);
// //sleep(1);
// #echo($write);
// fclose($myfile);
//$src="forward/nprg_ca.html";
//$src="forward/$txt.html";

$src="index_h.html";
//$src="https://echtzeit.rotefadenbuecher.de/window.html";
//$src="https://ada-sub.dh-index.org/school/pr/2022-11-14";
$file=fopen($src,"r");
$srcbyte=filesize($src);
$stat=stat($src);
//echo readfile($src); 
echo fread($file,$srcbyte);
//echo "last modified: ";
#echo(date("Ymd(H.m)", $stat['mtime']));
fclose($file);


?>