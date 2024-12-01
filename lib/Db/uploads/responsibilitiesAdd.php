<?php
require_once '../conn.php';
$con = mysqli_connect(DB_HOST,DB_USERNAME,DB_PASSWORD,DB_NAME) or die('Connection Failed.');
$name = $_POST['name'];
$location = $_POST['location'];
$duration = $_POST['duration'];
$organization = $_POST['organization'];
$role = $_POST['role'];

$query = "SELECT * FROM responsibility WHERE name = '".$name."'";
$result = mysqli_query($con, $query);
$count = mysqli_num_rows($result);
if($count == 1){
    echo json_encode("Error");
} else {
    $insertQuery = "INSERT INTO responsibility(name,organization,duration,location,role) values
    ('".$name."','".$organization."','".$duration."','".$location."','".$role."')";
    $query = mysqli_query($con, $insertQuery);
    if($query){
        echo json_encode("Success");
    } else{
        echo json_encode("Error");
    }
}
?>
