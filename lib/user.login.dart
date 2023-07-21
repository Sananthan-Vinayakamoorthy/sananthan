import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'data_storage.dart';
import 'containerpassing.dart';




class Userpage extends StatefulWidget {
  @override
  _UserpageState createState() => _UserpageState();
}

class _UserpageState extends State<Userpage> {
  String? _imagePath;
  final picker = ImagePicker();
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();
  final TextEditingController _textEditingController3 = TextEditingController();
  final TextEditingController _textEditingController4 = TextEditingController();

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
      _imagePath = image.path;
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
                child: _imagePath != null
                    ? Stack(
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
                controller: _textEditingController2,
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
            SizedBox(height: 10),
            Container(
              width: 300,
              height: 50,
              child: TextField(
                controller: _textEditingController3,
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
            SizedBox(height: 10),
            Container(
              width: 300,
              height: 50,
              child: TextField(
                controller: _textEditingController4,
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
                DataStorage.imagePath = _imagePath!;
                DataStorage.stringData = _textEditingController.text;
                DataStorage.stringData2 = _textEditingController2.text;
                DataStorage.stringData3= _textEditingController3.text;
                DataStorage.stringData4 = _textEditingController4.text;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Check(
                      containerData: ContainerData(
                        imagePath: _imagePath,
                        stringData: _textEditingController.text,
                        stringData2: _textEditingController2.text,
                        stringData3: _textEditingController3.text,
                        stringData4: _textEditingController4.text,


                      ),
                    ),
                  ),
                );



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









class Check extends StatefulWidget {
  final ContainerData containerData;

  const Check({required this.containerData});

  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {
  bool showContainerData = false;
  List<ContainerData> containerList = [];

  @override
  void initState() {
    super.initState();
    // Initially, add a single container
    containerList.add(widget.containerData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 50,
            color: Colors.blueAccent,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Userpage()),
                  ).then((containerData) {
                    // When returning from Userpage, add a new container
                    if (containerData != null) {
                      setState(() {
                        containerList.add(containerData);
                      });
                    }
                  });
                },
                child: Container(
                  width: 100,
                  height: 50,
                  color: Colors.red,
                ),
              ),
              SizedBox(width: 20),
              Container(
                width: 100,
                height: 50,
                color: Colors.red,
              ),
              SizedBox(width: 20),
              Container(
                width: 100,
                height: 50,
                color: Colors.red,
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                showContainerData = !showContainerData;
              });
            },
            child: Container(
              height: 25,
              width: 380,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/category_box.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          SizedBox(width: 100),
                          if (showContainerData)
                            Image.asset(
                              'assets/arrow.png',
                              width: 24,
                              height: 24,
                              color: Colors.white,
                            )
                          else
                            Image.asset(
                              'assets/arrow_open.png',
                              width: 24,
                              height: 24,
                              color: Colors.white,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (showContainerData)
            Container(
              height: 400,
              width: 370,
              child: ListView(
                children: containerList.map((containerData) {
                  return ContainerData(
                    imagePath: containerData.imagePath,
                    stringData: containerData.stringData,
                    stringData2: containerData.stringData2,
                    stringData3: containerData.stringData3,

                  );
                }).toList(),
              ),
            ),
          SizedBox(height: 10),
          Container(
            height: 25,
            width: 380,
           color: Colors.orange,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Test(),
                ),
              );
            },
            child: Text('Go to Test'),
          ),
        ],
      ),
    );
  }
}



class Test extends StatefulWidget {
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
                      // Use a default image if imagePath is null
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

          Container(
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
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(DataStorage.imagePath), // Use DataStorage.imagePath for the drawer header
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Username',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
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
    );
  }
}








class ContainerData extends StatefulWidget {
  final String? imagePath;
  final String? stringData;
  final String? stringData2;
  final String? stringData3;
  final String? stringData4;

  const ContainerData({
    this.imagePath,
    this.stringData,
    this.stringData2,
    this.stringData3,
    this.stringData4,
  });

  @override
  _ContainerDataState createState() => _ContainerDataState();
}

class _ContainerDataState extends State<ContainerData> {
  bool isGreen = false;
  bool isRed = false;
  bool isCheckClicked = false;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.stringData ?? ''),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        // Handle the deletion here (e.g., remove the container from the list)
        // You can add your custom logic to handle the dismissal action
      },
      background: Container(
        width: 50,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(),
            Image.asset(
              'assets/delete_column_button.png',

            ),
          ],
        ),
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isGreen = true;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: isGreen ? Colors.green : (isRed ? Colors.red : Colors.black),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.white, width: 2.0),
          ),
          height: 100,
          width: 370,
          child: Stack(
            children: [
              if (isCheckClicked)
                Positioned(
                  top: 10,
                  left: 10,
                  child: Icon(
                    Icons.star, // Replace with your custom icon data
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              Row(
                children: [
                  Container(
                    height: 200,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.black, width: 2.0),
                    ),
                    child: Image.file(
                      File(widget.imagePath ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.stringData ?? ''}',
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '${widget.stringData2 ?? ''}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '${widget.stringData3 ?? ''}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (!isCheckClicked)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isRed = true;
                        });
                      },
                      child: Container(
                        height: 100,
                        width: 63,
                        child: Image.asset(
                          'assets/x_filled.png',
                        ),
                      ),
                    ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isGreen = true;
                        isCheckClicked = true;
                      });
                    },
                    child: Container(
                      height: 100,
                      width: 63,
                      child: Image.asset(
                        'assets/check_filled.png',
                        width: 50,
                        height: 60,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}






class Userpage2 extends StatefulWidget {
  @override
  _Userpage2State createState() => _Userpage2State();
}

class _Userpage2State extends State<Userpage> {
  String? _imagePath;
  final picker = ImagePicker();
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();
  final TextEditingController _textEditingController3 = TextEditingController();
  final TextEditingController _textEditingController4 = TextEditingController();

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
      _imagePath = image.path;
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
                child: _imagePath != null
                    ? Stack(
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
                controller: _textEditingController2,
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
            SizedBox(height: 10),
            Container(
              width: 300,
              height: 50,
              child: TextField(
                controller: _textEditingController3,
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
            SizedBox(height: 10),
            Container(
              width: 300,
              height: 50,
              child: TextField(
                controller: _textEditingController4,
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
                DataStorage.imagePath = _imagePath!;
                DataStorage.stringData = _textEditingController.text;
                DataStorage.stringData2 = _textEditingController2.text;
                DataStorage.stringData3= _textEditingController3.text;
                DataStorage.stringData4 = _textEditingController4.text;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Check(
                      containerData: ContainerData(
                        imagePath: _imagePath,


                      ),
                    ),
                  ),
                );



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



