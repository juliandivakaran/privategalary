<?php
// Establish database connection
$con = mysqli_connect("localhost", "root", "toor", "onesoft");

if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}

if (isset($_GET['id'])) {
    $id = intval($_GET['id']); 

    // Fetch image from database
    $query = "SELECT image FROM image_store WHERE id = $id";
    $result = mysqli_query($con, $query);

    if ($row = mysqli_fetch_assoc($result)) {
        header("Content-Type: image/jpeg"); 
        echo $row['image'];
    } else {
        echo "Image not found.";
    }
} else {
    echo "No image ID provided.";
}

mysqli_close($con);
?>
