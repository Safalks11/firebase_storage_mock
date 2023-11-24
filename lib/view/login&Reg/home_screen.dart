import 'package:flutter/material.dart';

import '../../authservice.dart';
import '../image_picker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _authService = AuthService();
  final ImagePickerService _imagePickerService = ImagePickerService();

  List<String?> _imageUrls = [];
// List to store image URLs

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Homepage'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              await _authService.signOut();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                String? imagePath =
                    await _imagePickerService.pickImageFromGallery();
                if (imagePath != null) {
                  String? imageUrl =
                      await _imagePickerService.uploadImage(imagePath);
                  setState(() {
                    _imageUrls.add(imageUrl!);
                  });
                }
              },
              child: Text('Pick Image from Gallery'),
            ),
            ElevatedButton(
              onPressed: () async {
                String? imagePath =
                    await _imagePickerService.pickImageFromCamera();
                if (imagePath != null) {
                  String? imageUrl =
                      await _imagePickerService.uploadImage(imagePath);
                  setState(() {
                    _imageUrls.add(imageUrl);
                  });
                }
              },
              child: Text('Capture Image from Camera'),
            ),
            SizedBox(height: 16.0),
            Column(
              children: _imageUrls.map((imageUrl) {
                return Image.network(
                  imageUrl!,
                  height: 100,
                  width: 100,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
