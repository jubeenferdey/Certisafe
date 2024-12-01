<?php
error_reporting(0);
$msg = "";
$conn = mysqli_connect("localhost","root","","loyolite");
if(!$conn){
    die("Error while connecting to the database");
} else{
// If upload button is clicked ...

if ($_SERVER['REQUEST_METHOD'] === 'POST'){
    $filename = $_POST['name'];
    $filepath = $_POST['path'];
    $file_extension = substr($file_name, strrpos($filename, '.') + 1);
    $file_url = $upload_url . $filename; // in server
    $file_path = $upload_path . $filename; // the directory in which the image resides.
    $imagePath = "/uploads/".$filename;
    $query = "INSERT INTO userfiles(url,name) values('".$filepath."', '".$filename."')";
    $result = mysqli_query($con, $query);
    if ($filename) {
        move_uploaded_file($filename['tmp_name'], $imagePath);
    }

}
}
?>