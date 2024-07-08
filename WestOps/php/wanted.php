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
    die(json_encode(["error" => "Connection failed: " . $conn->connect_error]));
}

// SQL query to select all wanted persons
$sql = "SELECT wantedPersonID, firstName, lastName, gender, dateOfBirth, crimeDescription, photoURL, rewardAmount, contactPhoneNumber, status, Verify, userID FROM wanted_persons";
$result = $conn->query($sql);

// Initialize an empty array to store the results
$wantedPersons = array();

// Fetch the results
if ($result) {
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $wantedPersons[] = $row;
        }
    }
    // Output the results as JSON
    echo json_encode($wantedPersons);
} else {
    echo json_encode(["error" => "Query failed: " . $conn->error]);
}

// Close connection
$conn->close();
?>
