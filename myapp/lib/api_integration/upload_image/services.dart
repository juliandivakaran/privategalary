import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class UploadApiImage {
  Future<dynamic> UploadImage(
    Uint8List bytes,
    String fileName,
    String comment,
    String folderName, // Add folder name here
  ) async {
    Uri url = Uri.parse("http://192.168.8.111/onesoft/api.php"); // Replace with your local IP
    var request = http.MultipartRequest('POST', url);

    // Add the image file to the request
    var myFile = http.MultipartFile(
      "image", 
      http.ByteStream.fromBytes(bytes),
      bytes.length,
      filename: fileName,
    );
    request.files.add(myFile);

    // Add the comment and folder name to the request
    request.fields['comment'] = comment;
    request.fields['folder_name'] = folderName;

    // Send the request and wait for the response
    final response = await request.send();
    if (response.statusCode == 200) {
      var rawResponse = await response.stream.bytesToString();
      print("Raw response: $rawResponse");  // Debugging output

      try {
        var data = jsonDecode(rawResponse);
        return data;
      } catch (e) {
        print("Error decoding JSON: $e");
        return null;
      }
    } else {
      print("Error: ${response.statusCode}");
      return null;
    }
  }
}
