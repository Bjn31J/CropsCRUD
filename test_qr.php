<?php include('lib/phpqrcode/qrlib.php'); 
$file_name = 'qr/ejemplo.png';
QRcode::png('http://google.com.mx', $file_name,2,2,2);
?>