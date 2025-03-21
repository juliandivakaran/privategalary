# Flutter Image Upload App with PHP & MySQL

## Project Overview
This project is a **Flutter mobile application** that allows users to **upload images with comments**, store them in a **MySQL database**, and retrieve them using a **PHP backend API** hosted in XAMPP.

## Features
- Users can **select an image** from the gallery or capture a photo using the camera.
- A **text input field** to enter comments.
- A **submit button** to upload the image along with the comment.
- A **list view** displaying previously uploaded images with comments.
- Images are stored in a specific folder on the server.

## Tech Stack
### Frontend:
- Flutter (Dart)

### Backend:
- PHP
- MySQL

## Installation & Setup
### 1. Clone the Repository
```bash
 git clone <your-repository-url>
```

### 2. Set Up the Backend (PHP & MySQL)
1. Install **XAMPP** if not already installed.
2. Navigate to the `htdocs` directory inside the XAMPP installation folder:
   ```bash
   cd C:\xampp\htdocs
   ```
3. Create a folder (e.g., `onesoft`) and place the **PHP files** inside it.
4. Start **Apache** and **MySQL** from the XAMPP Control Panel.
5. Create a **MySQL database** and import the provided `onesoft_image_store.sql` file.
6. Update the **PHP scripts** to match your database credentials.

### 3. Configure Flutter App
1. Open the Flutter project in **VS Code**.
2. Modify the API base URL in your code to match your local machine's IPv4 address. Replace:
   ```dart
   http://192.168.**.***/onesoft/get_images.php
   ```
   with your machine's actual IPv4 address.

3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app on an emulator or a physical device:
   ```bash
   flutter run
   ```

## API Endpoints
### Upload Image and Comment
**Endpoint:** `POST /upload_image.php`

**Parameters:**
- `image` (File)
- `comment` (String)

**Response:**
```json
{
  "status": "success",
  "message": "Image uploaded successfully."
}
```

### Fetch Images and Comments
**Endpoint:** `GET /get_images.php`

**Response:**
```json
[
  {
    "image_url": "http://192.168.**.***/onesoft/uploads/image1.jpg",
    "comment": "Nice view!",
    "timestamp": "2025-03-20 10:30:00"
  }
]
```

## Notes
- Ensure the **IPv4 address** is updated correctly for API requests.
- The image upload directory must have **write permissions**.
- If using an emulator, use the local network IP instead of `localhost`.

## License
This project is licensed under the **MIT License**.

