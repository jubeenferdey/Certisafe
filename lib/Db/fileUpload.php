<?php
require_once 'conn.php';

if($_SERVER['REQUEST_METHOD']=='POST'){
    if(isset($_POST['name'])){
        $con = mysqli_connect(DB_HOST,DB_USERNAME,DB_PASSWORD,DB_NAME) or die('Connection Failed.');
        $upload_path = 'uploads/';
 
//Getting the server ip
$server_ip = gethostbyname(gethostname());
 
//creating the upload url
$upload_url = 'http://'.$server_ip.'/teachers_diary/lib/Db/'.$upload_path;
print($upload_url);
$response = array();

$filename = $_POST['name'];
$filepath = $_POST['path'];
$file_extension = substr($file_name, strrpos($filename, '.') + 1);
$file_url = $upload_url . $filename; // in server
$file_path = $upload_path . $filename; // the directory in which the image resides.
    
$query = "SELECT * FROM userfiles WHERE url = '".$filepath."'AND name = '".$filename."'";
$result = mysqli_query($con, $query);
try{
    //saving the file
    move_uploaded_file($_FILES['pdf']['tmp_name'],$file_path);
    $sql = "INSERT INTO userfiles(url,name) values('".$filepath."', '".$filename."')";

    //adding the path and name to database
    if(mysqli_query($con,$sql)){

        //filling response array with values
        $response['error'] = false;
        $response['url'] = $file_url;
        $response['name'] = $name;
    }
    //if some error occurred
}catch(Exception $e){
    $response['error']=true;
    $response['message']=$e->getMessage();
} 
//closing the connection
mysqli_close($con);
}else{
$response['error']=true;
$response['message']='Please choose a file';
}

//displaying the response
echo json_encode($response);
}
// $count = mysqli_num_rows($result);

// if($count == 1){
//     echo json_decode("Error");
// } else {
//     $insertQuery = "INSERT INTO userfiles(url,name) values('".$filepath."', '".$filename."')";
//     $query = mysqli_query($con, $insertQuery);
//     if($query){
//         echo json_encode("Success");
//     }
// }
//     }


?>
