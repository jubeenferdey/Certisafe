<?php
require_once 'conn.php';
$con = mysqli_connect(DB_HOST,DB_USERNAME,DB_PASSWORD,DB_NAME) or die('Connection Failed.');
$email = $_POST['email'];
$password = $_POST['password'];
$Staff_ID = $_POST['staffID'];
$Staff_Name = $_POST['name'];
$Staff_DOB = $_POST['dob'];
$Staff_PhNum = $_POST['phnum'];
$Staff_Address =$_POST['address'];
$Staff_Shift =$_POST['shift'];
$Staff_Designation =$_POST['role'];
$Staff_Dept =$_POST['dept'];
$Staff_Gender =$_POST['gender'];
$Staff_Responsiblity =$_POST['responsibility'];
$Staff_MarritalSt =$_POST['maritalStatus'];

// $query = "SELECT * FROM usercred WHERE email = '".$email."'AND password = '".$password."'";
// $result = mysqli_query($con, $query);
// $count = mysqli_num_rows($result);

// if($count == 1){
//     echo json_decode("Error");
// } else {
//     $insertQuery = "INSERT INTO usercred(email,password) values('".$email."', '".$password."')";
//     $query = mysqli_query($con, $insertQuery);
//     if($query){
//         echo json_encode("Success");
//     } else{
//         echo json_encode("Error");
//     }
// }

$Emailquery = "INSERT INTO usercred values ( '".$Staff_ID."', '".$Staff_Name."' , '".$email."', '".$password."')";


$insertQuery = "INSERT INTO userdetails values (
                                        '".$Staff_ID."'
                                        , '".$Staff_Name."'
                                        , '".$Staff_DOB."'
                                        , '".$Staff_PhNum."'
                                        , '".$Staff_Address."'
                                        , '".$Staff_Shift."'
                                        , '".$Staff_Designation."'
                                        , '".$Staff_Dept."'
                                        , '".$Staff_Gender."'
                                        , '".$Staff_Responsiblity."'
                                        , '".$Staff_MarritalSt."'
                                                )";

$query = mysqli_query($con, $insertQuery);
$query1 = mysqli_query($con, $Emailquery);

    if($query && $query1){
        echo json_encode("Success");
    } else{
        echo json_encode("Error");
    }
?>