<?php
require_once '../conn.php';
$con = mysqli_connect(DB_HOST,DB_USERNAME,DB_PASSWORD,DB_NAME) or die('Connection Failed.');
$title = $_POST['title'];
$patentID = $_POST['patentID'];
$year = $_POST['year'];

$query = "SELECT * FROM publication WHERE patentID = '".$patentID."'AND title = '".$title."'";
$result = mysqli_query($con, $query);
$count = mysqli_num_rows($result);
if($count == 1){
    echo json_decode("Error");
} else {
    $insertQuery = "INSERT INTO publication(title, patentid, year) values
    ('".$title."','".$patentID."','".$year."')";
    $query = mysqli_query($con, $insertQuery);
    if($query){
        echo json_encode("Success");
    } else{
        echo json_encode("Error");
    }
}
?>