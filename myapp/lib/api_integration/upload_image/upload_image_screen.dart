import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/api_integration/upload_image/services.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _folderController = TextEditingController(); // Folder name controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade800, Colors.blueAccent],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Comment TextField
                  TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      labelText: 'Enter your comment',
                      labelStyle: TextStyle(color: Colors.white70),
                      hintText: 'Write something about the image...',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white70, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.amberAccent, width: 2),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 20),

                  

                  // Upload Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () async {
                      final ImagePicker picker = ImagePicker();
                      final XFile? image =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        Uint8List bytes = await image.readAsBytes();
                        String comment = _commentController.text;
                        String folderName = _folderController.text;

                        UploadApiImage().UploadImage(bytes, image.name, comment, folderName).then((value) {
                          setState(() {});
                          print("Uploaded successfully with response: $value");
                        }).catchError((error, stackTrace) {
                          print("Error: $error");
                          print("Stack trace: $stackTrace");
                        });
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text("Upload Image",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.amberAccent,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
