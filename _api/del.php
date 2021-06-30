<?php
include_once("../_config/config.php");

mysqli_query($con, "DELETE FROM uas WHERE id = '$_GET[id]'");