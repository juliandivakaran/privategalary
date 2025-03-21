import 'package:flutter/material.dart';
import 'api_integration/upload_image/upload_image_screen.dart'; // Your UploadImage screen
import 'api_integration/upload_image/view_images_screen.dart'; // The new ViewImages screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Private Gallery'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade800, Colors.blueAccent],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                onPressed: () {
                  // Navigate to the UploadImage screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UploadImage()),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Upload Image",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.amberAccent,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                onPressed: () {
                  // Navigate to the ViewImages screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ViewImages()),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "View Images",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.amberAccent,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
