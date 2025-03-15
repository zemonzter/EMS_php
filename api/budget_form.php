<?php

include 'dbconnection.php';
$con=dbconnection();

if(isset($_POST["budgetname"]))
{
    $budgetname=$_POST["budgetname"];
}
else return;

if(isset($_POST["budgetamount"]))
{
    $budgetamount=$_POST["budgetamount"];
}
else return;

if(isset($_POST["budgetyear"]))
{
    $budgetyear=$_POST["budgetyear"];
}
else return;

if(isset($_POST["budgettype"]))
{
    $budgettype=$_POST["budgettype"];
}
else return;

$query = "INSERT INTO `budget_table`(`budget_name`, `budget_amount`, `budget_year`, `budget_type`) VALUES ('$budgetname','$budgetamount','$budgetyear','$budgettype')";

$exe=mysqli_query(mysql: $con,query: $query);

$arr=[];
if($exe)
{
    $arr["success"]="true";
}
else
{
    $arr["success"]="false";
}

print(json_encode(value: $arr));

?>
