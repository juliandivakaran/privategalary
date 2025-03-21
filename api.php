<?php
// Establish the connection
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");
header("Access-Control-Allow-Methods: POST");
$con = mysqli_connect("localhost", "root", "toor", "onesoft");

// Check if the connection is successful
if (!$con) {
    die(json_encode(["error" => "Connection failed: " . mysqli_connect_error()])); 
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $comment = isset($_POST['comment']) ? mysqli_real_escape_string($con, $_POST['comment']) : '';
    $folderName = isset($_POST['images']) ? $_POST['images'] : 'default_folder';

    $uploadDir = "C:/Users/user/Desktop/newflutter/images/" . $folderName . "/";

    // Ensure the folder exists or create it
    if (!file_exists($uploadDir)){
        mkdir($uploadDir, 0777, true);
    }

    if (isset($_FILES['image']) && $_FILES['image']['error'] == 0) {
        $image = $_FILES['image']['tmp_name'];
        $imageContent = addslashes(file_get_contents($image));
        
        // Use the original name of the file for the destination
        $imageName = basename($_FILES['image']['name']);
        $imagePath = $uploadDir . $imageName;

        if (move_uploaded_file($image, $imagePath)) {
            $imagePath = mysqli_real_escape_string($con, $imagePath);
        }

        // Insert data into the database
        $query = "INSERT INTO image_store (image, comment) VALUES ('$imageContent', '$comment')";

        if (mysqli_query($con, $query)) {
            echo json_encode(["message" => "Image and comment uploaded successfully!"]);
        } else {
            echo json_encode(["error" => "Upload failed: " . mysqli_error($con)]);
        }
    } else {
        echo json_encode(["error" => "No image file uploaded or error in uploading image."]);
    }
} else {
    echo json_encode(["error" => "Invalid request method"]);
}

mysqli_close($con);
?>
