<?php

header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header('Content-Type: application/json');
// Database credentials
$servername = "localhost";
$username = "root";
$password = ""; // Replace with your MySQL password if set
$dbname = "westapp";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT vehicleID, make, model, year, color, licensePlate, description, dateStolen, lastKnownLocation, ownerName, ownerContact, rewardAmount, status, Verify, userID FROM StolenVehicles";
$result = $conn->query($sql);

$stolenVehicles = array();

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $stolenVehicles[] = $row;
    }
} else {
    echo "0 results";
}

$conn->close();

header('Content-Type: application/json');
echo json_encode($stolenVehicles);
?>
