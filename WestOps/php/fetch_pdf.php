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

// Fetch PDF document from the database
$sql = "SELECT id, title, pdf_data FROM Documents WHERE id = 1"; // Modify the WHERE clause as needed
$result = $conn->query($sql);

$document = array();

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        // Base64 encode the PDF data
        $row['pdf_data'] = base64_encode($row['pdf_data']);
        $document[] = $row;
    }
} else {
    echo json_encode(["message" => "No duty document available"]);
    exit();
}

$conn->close();

echo json_encode($document);
?>
