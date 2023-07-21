import 'dart:io';
import 'package:cameara_on/customWidget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'data_storage2.dart';
final TextEditingController _textEditingController1 = TextEditingController();


const Color myGrey = Color(0xFF2D2D2D);
const Color myBlack = Color(0xFF231F20);
const Color myhash = Color(0xFF929091);
const Color mycamera = Color(0xFF161616);

class NewItem extends StatefulWidget {
  @override
  _NewItemState createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  String? _imagePath2;
  final picker = ImagePicker();
  final TextEditingController _textEditingController = TextEditingController();

  Future<void> getImage(ImageSource source) async {
    final image = await picker.pickImage(source: source);
    if (image == null) return;

    setState(() {
      _imagePath2 = image.path;
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
              leading: Icon(Icons.add_a_photo_outlined),
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

  Future<void> showImageInfoDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Image Info'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Image Path: $_imagePath2'),
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
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take a Photo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_imagePath2 != null)
              GestureDetector(
                onTap: () {
                  // Handle navigation to the image path here
                  // For example:
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ImagePreviewScreen(imagePath: _imagePath),
                  //   ),
                  // );
                },
                child: Container(
                  height: 200,
                  width: 200,
                  child: Image.file(
                    File(_imagePath2!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            if (_imagePath2 == null)
              GestureDetector(
                onTap: () {
                  showImagePickerOptions(context);
                },
                child: Container(
                  height: 200,
                  width: 200,
                  color: mycamera,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_a_photo_outlined,
                        size: 48,
                        color: myhash,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Take a Photo',
                        style: TextStyle(
                          color: myhash,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            SizedBox(height: 20),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
                    child: TextField(

                      controller: _textEditingController,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'CATEGORY:',
                        hintStyle: TextStyle(
                          color: Colors.white54,
                        ),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        DataStorage.stringData1 = value; // Store the entered text in the DataStorage class
                      },
                    ),
                  ),
                  Flexible(
                    child: customTextField(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            inputContainer2(context, labelText: 'NAME:'),
            SizedBox(height: 20),
            inputContainer3(context, labelText: 'WEIGHT:'),
            SizedBox(height: 20),
            inputContainer4(context, labelText: 'COUNT:'),
            SizedBox(height: 30),
            InkWell(
              onTap: () {
                // Handle button tap
              },
              child: Image.asset(
                'assets/Fbutton.png',
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class CustomButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onClick;

  const CustomButton({
    required this.title,
    required this.icon,
    required this.onClick,
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

class HalfBorderPainter extends CustomPainter {
  final Color color;
  final double width;

  HalfBorderPainter({required this.color, required this.width});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = width
      ..style = PaintingStyle.stroke;

    final path = Path();

    // Draw the top and right borders
    path.moveTo(0, 0);
    path.lineTo(size.width/8, 0);
    path.moveTo(0, 0);
    path.lineTo(0, size.height / 8);

    // Draw the top and left borders
    path.moveTo(size.width*7/8, 0);
    path.lineTo(size.width, 0 );
    path.lineTo(size.width, size.height/8);

    // Draw the bottom and left borders
    path.moveTo(0,size.height*7/8,);
    path.lineTo(0,size.height );
    path.lineTo(size.width/8, size.height);


    // Draw the bottom and left borders
    path.moveTo(0,size.height*7/8,);
    path.lineTo(0,size.height );
    path.lineTo(size.width/8, size.height);

    // Draw the bottom and left borders
    path.moveTo(size.width*7/8, size.height);
    path.lineTo(size.height,size.height );
    path.lineTo(size.width, size.height*7/8);

    canvas.drawPath(path, paint);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
