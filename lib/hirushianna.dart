import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'data_storage.dart';
import 'fakemain.dart';



class Userpage extends StatefulWidget {
  @override
  _UserpageState createState() => _UserpageState();
}

class _UserpageState extends State<Userpage> {
  String? _imagePath1;
  final picker = ImagePicker();
  final TextEditingController _textEditingController = TextEditingController();

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

  Future<void> getImage(ImageSource source) async {
    final image = await picker.pickImage(source: source);
    if (image == null) return;

    setState(() {
      _imagePath1 = image.path;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                showImagePickerOptions(context);
              },
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: Colors.white24,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: _imagePath1 != null
                    ? Stack(
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
                )
                    : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_a_photo_outlined,
                        size: 48,
                        color: Colors.white,
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            Container(
              width: 300,
              height: 50,
              child: TextField(
                controller: _textEditingController,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'EMAIL ADDRESS',
                  hintStyle: TextStyle(
                    color: Colors.white54,
                  ),
                  border: InputBorder.none,
                ),
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 300,
              height: 50,
              child: TextField(
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'PASSWORD',
                  hintStyle: TextStyle(
                    color: Colors.white54,
                  ),
                  border: InputBorder.none,
                ),
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Store the image path and string data before navigating to the Check page
                DataStorage.imagePath = _imagePath1!;
                DataStorage.stringData = _textEditingController.text;

                if (_imagePath1 != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Test(imagePath: _imagePath1!),
                    ),
                  );

                }



              },
              child: Text(
                'CHECK',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ContainerData extends StatelessWidget {
  final String? imagePath;
  final String? stringData;

  const ContainerData({this.imagePath, this.stringData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 400,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            color: Colors.red,
            child: Image.file(
              File(imagePath ?? ''),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 200,
            height: 50,
            color: Colors.green,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' ${stringData ?? ''}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    ' ${stringData ?? ''}',
                    style: TextStyle(fontSize: 18),
                  ),

                ],
              ),
            ),

          ),
          Container(
            height: 20,
            width: 50,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}







class Test extends StatefulWidget {
  final String imagePath;



  const Test({required this.imagePath});
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: FileImage(File(widget.imagePath)), // Load image from file
                      backgroundColor: Colors.transparent, // Set background color to transparent
                      child: ClipOval(
                        child: Image.file(
                          File(widget.imagePath), // Load image from file
                          fit: BoxFit.cover, // Adjust the image inside the circular avatar
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Custom Header',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  title: Text('Item 1'),
                  onTap: () {
                    // Handle item 1 press
                  },
                ),
                ListTile(
                  title: Text('Item 2'),
                  onTap: () {
                    // Handle item 2 press
                  },
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckPage(imagePath: widget.imagePath),
                ),
              );
            },
            child: Text('Go to CheckPage'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ContainerData(
              imagePath: DataStorage.imagePath,
              stringData: DataStorage.stringData,
            ),
          ],
        ),
      ),
    );
  }
}



class CheckPage extends StatefulWidget {
  final String imagePath;

  const CheckPage({required this.imagePath});

  @override
  _CheckPageState createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: FileImage(File(widget.imagePath)), // Load image from file
                      backgroundColor: Colors.transparent, // Set background color to transparent
                      child: ClipOval(
                        child: Image.file(
                          File(widget.imagePath), // Load image from file
                          fit: BoxFit.cover, // Adjust the image inside the circular avatar
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Custom Header',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  title: Text('Item 1'),
                  onTap: () {
                    // Handle item 1 press
                  },
                ),
                ListTile(
                  title: Text('Item 2'),
                  onTap: () {
                    // Handle item 2 press
                  },
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Test(imagePath: widget.imagePath),
                ),
              );
            },
            child: Text('Go to CheckP'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ContainerData(
              imagePath: DataStorage.imagePath,
              stringData: DataStorage.stringData,
            ),
          ],
        ),
      ),
    );
  }
}










