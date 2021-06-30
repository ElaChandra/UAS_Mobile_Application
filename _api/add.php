<?php
include_once("../_config/config.php");

$id = ($_POST['id']);
$nama = trim(mysqli_real_escape_string($con, $_POST['nama']));
$alamat = trim(mysqli_real_escape_string($con, $_POST['alamat']));
$no_hp = trim(mysqli_real_escape_string($con, $_POST['no_hp']));
$agama = trim(mysqli_real_escape_string($con, $_POST['agama']));
mysqli_query($con, "INSERT INTO tb_dokter VALUES('$id', '$nama', '$alamat', '$no_hp', '$agama')");