<?php
include 'conn.php';
$con = mysqli_connect(DB_HOST,DB_USERNAME,DB_PASSWORD,DB_NAME) or die('Connection Failed.');
$email = $_POST['email'];
$password = $_POST['password'];

$query = "SELECT * FROM usercred WHERE email = '".$email."'AND password = '".$password."'";
$result = mysqli_query($con, $query);
$count = mysqli_num_rows($result);

if($count == 1){
    echo json_encode("Authenticated");
} else {
    echo json_encode("Auth Error");
}
?>