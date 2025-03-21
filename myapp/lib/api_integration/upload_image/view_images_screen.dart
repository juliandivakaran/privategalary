import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ViewImages extends StatefulWidget {
  const ViewImages({super.key});

  @override
  State<ViewImages> createState() => _ViewImagesState();
}

class _ViewImagesState extends State<ViewImages> {
  List<Map<String, dynamic>> images = []; // List to store the images and comments

  // Fetch the images and comments from the backend
  Future<void> fetchImages() async {
    final url = Uri.parse("http://192.168.8.111/onesoft/get_images.php"); // Your PHP API endpoint
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      setState(() {
        images = data
            .map((imageData) => {
                  'image': imageData['image'], // Base64 string of the image
                  'comment': imageData['comment'], // Comment
                })
            .toList();
      });
    } else {
      print("Failed to fetch images");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchImages(); // Fetch images and comments when the screen is loaded
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Uploaded Images"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: images.isEmpty
            ? const CircularProgressIndicator() // Show loading indicator while images are being fetched
            : ListView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) {
                  String imageBase64 = images[index]['image']!;
                  String comment = images[index]['comment']!;

                  // Decode the base64 image string to bytes
                  Uint8List imageBytes = base64Decode(imageBase64);

                  return Card(
                    child: ListTile(
                      leading: Image.memory(imageBytes), // Display image from bytes
                      title: Text(comment), // Display comment
                    ),
                  );
                },
              ),
      ),
    );
  }
}
