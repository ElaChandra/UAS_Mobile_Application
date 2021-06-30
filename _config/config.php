<?php
// koneksi ke database
$con=mysqli_connect('localhost','root','','uas');
if(mysqli_connect_errno()){
    echo mysqli_connect_error();
}
?>