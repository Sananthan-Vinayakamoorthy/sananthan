import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageStorage {
  static String? imagePath;
}

class Pic extends StatefulWidget {
  @override
  _PicState createState() => _PicState();
}

class _PicState extends State<Pic> {
  String? _imagePath1;
  final picker = ImagePicker();

  Future<void> getImage(ImageSource source) async {
    final image = await picker.pickImage(source: source);
    if (image == null) return;

    setState(() {
      _imagePath1 = image.path;
    });
  }

  Future<void> showImagePickerOptions(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera),
              title: Text('Camera'),
              onTap: () {
                Navigator.pop(context);
                getImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                getImage(ImageSource.gallery);
              },
            ),
          ],
        );
      },
    );
  }

  void _finishButtonPressed() {
    if (_imagePath1 != null) {
      ImageStorage.imagePath = _imagePath1;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AnotherClass()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take a Photo'),
      ),
      body: Container(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  color: Colors.black,
                ),
                Container(),
              ],
            ),
            Row(
              children: [
                if (_imagePath1 != null)
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Image Info'),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Image Path: $_imagePath1'),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      color: Colors.blue, // Replace with your desired background color
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.file(
                            File(_imagePath1!),
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ImagePreviewScreen(imagePath1: _imagePath1!),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: EdgeInsets.all(8),
                                child: Icon(
                                  Icons.image,
                                  color: Colors.white,
                                  size: 32,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (_imagePath1 == null)
                  GestureDetector(
                    onTap: () {
                      showImagePickerOptions(context);
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      color: Colors.blue, // Replace with your desired background color
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera,
                              size: 48,
                              color: Colors.white,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Take a Photo',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: _finishButtonPressed,
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class AnotherClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Another Class'),
      ),
      body: Center(
        child: Image.file(
          File(ImageStorage.imagePath!),
        ),
      ),
    );
  }
}

class ImagePreviewScreen extends StatelessWidget {
  final String imagePath1;

  const ImagePreviewScreen({required this.imagePath1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Preview'),
      ),
      body: Center(
        child: Image.file(
          File(imagePath1),
        ),
      ),
    );
  }
}


