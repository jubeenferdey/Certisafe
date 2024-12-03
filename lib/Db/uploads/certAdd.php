<?php
require_once '../conn.php';
$con = mysqli_connect(DB_HOST,DB_USERNAME,DB_PASSWORD,DB_NAME) or die('Connection Failed.');
$certTitle = $_POST['title'];
$location = $_POST['location'];
$issuedYear = $_POST['year'];
$email = $_POST['email'];
$filename = $_POST['name'];
$filepath = $_POST['path'];
$file_extension = substr($filename, strrpos($filename, '.') + 1);
$file_url = $upload_url . $filename; // in server
$file_path = $upload_path . $filename; // the directory in which the image resides.
    

if ($_SERVER['REQUEST_METHOD']=='POST') {
    if (isset($_POST['name'])) {
        $con = mysqli_connect(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME) or die('Connection Failed.');
        $upload_path = 'uploads/';
 
        //Getting the server ip
        $server_ip = gethostbyname(gethostname());
 
        //creating the upload url
        $upload_url = 'http://'.$server_ip.'/teachers_diary/lib/Db/'.$upload_path;
        print($upload_url);
        $insertQuery = "INSERT INTO certification(title, location, year, email,fileName,url) values (
    '".$certTitle."' , '".$location."', 
    '".$issuedYear."', '".$email."',
    '".$filename."', '".$filepath."'  )";

        $insertResult = mysqli_query($con, $insertQuery);
        if ($insertResult) {
            echo json_encode("Success");
        } else {
            echo json_encode("Error");
        }
    }
}
?>
