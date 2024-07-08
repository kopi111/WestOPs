<?php
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

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

$sql = "SELECT missingPersonID, userID, firstName, lastName, gender, dateOfBirth, reportedDate, lastSeenLocation, description, photoURL, contactPerson, contactPhoneNumber, status, Verify FROM MissingPersons";
$result = $conn->query($sql);

$missingPersons = array();

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        // Ensure numeric fields are properly cast
        $row['missingPersonID'] = (int)$row['missingPersonID'];
        $row['userID'] = $row['userID'] !== null ? (int)$row['userID'] : null;
        $row['Verify'] = (int)$row['Verify'];

        $missingPersons[] = $row;
    }
} else {
    echo json_encode([]);
}

$conn->close();

echo json_encode($missingPersons);
?>
