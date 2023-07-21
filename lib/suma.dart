import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _imagePath;
  final picker = ImagePicker();

  Future<void> getImage(ImageSource source) async {
    final image = await picker.pickImage(source: source);
    if (image == null) return;

    setState(() {
      _imagePath = image.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take a Photo'),
      ),
      body: Column(
        children: [
          if (_imagePath != null)
            Container(
              height: 150,
              width: 150,
              color: Colors.blue, // Replace with your desired background color
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.file(
                    File(_imagePath!),
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        // Handle navigation to the image path here
                        // For example:
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ImagePreviewScreen(imagePath: _imagePath!),
                        //   ),
                        // );
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
            )
          else
            Column(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  color: Colors.blue, // Replace with your desired background color
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CustomButton(
                        title: 'Take a Photo',
                        icon: Icons.camera,
                        onClick: () {
                          getImage(ImageSource.camera);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.red, // Replace with your desired background color
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.green, // Replace with your desired background color
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.yellow, // Replace with your desired background color
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}
class CustomButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onClick;

  const CustomButton({
    required this.title,
    required this.icon,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 48,
          ),
          SizedBox(height: 8),
          Text(title),
        ],
      ),
    );
  }
}

