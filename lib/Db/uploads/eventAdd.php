<?php
require_once '../conn.php';
$con = mysqli_connect(DB_HOST,DB_USERNAME,DB_PASSWORD,DB_NAME) or die('Connection Failed.');
$title = $_POST['name'];
$location = $_POST['location'];
$duration = $_POST['duration'];
$description = $_POST['description'];
$eventLevel= $_POST['eventLevel'];

$query = "SELECT * FROM events WHERE title = '".$title."'AND location = '".$location."'";
$result = mysqli_query($con, $query);
$count = mysqli_num_rows($result);
if($count == 1){
    echo json_encode("Error");
} else {
    $insertQuery = "INSERT INTO events(title,location,duration,standard,description	) values
    ('".$title."','".$location."','".$duration."','".$eventLevel."','".$description."')";
    $query = mysqli_query($con, $insertQuery);
    if($query){
        echo json_encode("Success");
    } else{
        echo json_encode("Error");
    }
}
?>