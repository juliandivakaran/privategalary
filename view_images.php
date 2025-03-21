<?php
// Establish database connection
$con = mysqli_connect("localhost", "root", "toor", "onesoft");

// Check if the connection is successful
if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}

// Fetch images and comments from database
$query = "SELECT id, comment, created_at FROM image_store ORDER BY created_at DESC";
$result = mysqli_query($con, $query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Uploaded Images</title>
</head>
<body>
    <h2>Uploaded Images</h2>
    <table border="1">
        <tr>
            <th>Image</th>
            <th>Comment</th>
            <th>Uploaded At</th>
        </tr>
        <?php while ($row = mysqli_fetch_assoc($result)) { ?>
            <tr>
                <td><img src="display.php?id=<?php echo $row['id']; ?>" width="100" height="100"></td>
                <td><?php echo htmlspecialchars($row['comment']); ?></td>
                <td><?php echo $row['created_at']; ?></td>
            </tr>
        <?php } ?>
    </table>
</body>
</html>

<?php
mysqli_close($con);
?>
