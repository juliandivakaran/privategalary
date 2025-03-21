<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

// Establish the connection to the database
$con = mysqli_connect("localhost", "root", "toor", "onesoft");

// Check the connection
if (!$con) {
    die(json_encode(["error" => "Connection failed: " . mysqli_connect_error()]));
}

// Fetch images and comments from the database
$query = "SELECT image, comment FROM image_store";
$result = mysqli_query($con, $query);

// Check if any images are found
if (mysqli_num_rows($result) > 0) {
    $images = [];
    
    while ($row = mysqli_fetch_assoc($result)) {
        $images[] = [
            'image' => base64_encode($row['image']),  // Convert image to base64 string
            'comment' => $row['comment']
        ];
    }

    echo json_encode($images);
} else {
    echo json_encode(["message" => "No images found"]);
}

// Close the database connection
mysqli_close($con);
?>
