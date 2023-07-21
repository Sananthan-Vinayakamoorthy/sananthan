import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'check.dart';
import 'datastoragecopygl3.dart';

import 'mainnewlistcopyfromgl3.dart';




class Userpage extends StatefulWidget {
  @override
  _UserpageState createState() => _UserpageState();
}

class _UserpageState extends State<Userpage> {
  String? _imagePath;
  final picker = ImagePicker();
  bool isAlwaysLoginOn = false;
  bool isAllowSearchOn = false;
  bool light = true;
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();
  final TextEditingController _textEditingController3 = TextEditingController();
  final TextEditingController _textEditingController4 = TextEditingController();

  Future<void> getImage(ImageSource source) async {
    final image = await picker.pickImage(source: source);
    if (image == null) return;

    setState(() {
      _imagePath = image.path;
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
        DataStorage.stringData = _textEditingController.text;
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
              Text('Image Path: $_imagePath'),
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

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ListView(
          children: [Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.04),
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.1,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.3,
                  color: Colors.transparent,
                  child: Image.asset('assets/logo.png'),
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.03),
                GestureDetector(
                  onTap: _imagePath != null
                      ? showImageInfoDialog
                      : () => showImagePickerOptions(context),
                  child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.2,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(
                        color: Colors.white24,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(15),
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

                            ),
                          ),
                        ),
                      ],
                    )
                        : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 208,
                            height: 125,
                            decoration: BoxDecoration(
                              // Add any desired decoration properties
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.asset(
                              'assets/Picture_Box.png',
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 8),
                        ],
                      ),


                    ),
                  ),
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.02),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.8,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.07,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery
                              .of(context)
                              .size
                              .height * 0.05,
                        ),
                        child: Container(
                          width: 2.0,
                          height: 13.0,
                          child: VerticalDivider(
                            color: Colors.white24,
                            thickness: 3.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery
                                .of(context)
                                .size
                                .height * 0.037,
                          ),
                          child: Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.8,
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.07,
                            alignment: Alignment.centerRight,
                            // Adjust the alignment as needed
                            child: TextField(
                              controller: _textEditingController,
                              style: TextStyle(
                                color: Colors.white24,
                                fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.03,
                              ),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: 'NAME',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.white24,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),

                        ),

                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery
                              .of(context)
                              .size
                              .height * 0.05,
                        ),
                        child: Container(
                          width: 2.0,
                          height: 13.0,
                          child: VerticalDivider(
                            color: Colors.white24,
                            thickness: 3.0,
                          ),
                        ),
                      ),

                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.white24,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.02),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.8,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.07,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery
                              .of(context)
                              .size
                              .height * 0.05,
                        ),
                        child: Container(
                          width: 2.0,
                          height: 13.0,
                          child: VerticalDivider(
                            color: Colors.white24,
                            thickness: 3.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery
                                .of(context)
                                .size
                                .height * 0.037,
                          ),
                          child: Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.8,
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.07,
                            alignment: Alignment.centerRight,
                            // Adjust the alignment as needed
                            child: TextField(
                              controller: _textEditingController2,
                              style: TextStyle(
                                color: Colors.white24,
                                fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.03,
                              ),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: 'USER ID',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.white24,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),

                        ),

                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery
                              .of(context)
                              .size
                              .height * 0.05,
                        ),
                        child: Container(
                          width: 2.0,
                          height: 13.0,
                          child: VerticalDivider(
                            color: Colors.white24,
                            thickness: 3.0,
                          ),
                        ),
                      ),

                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.white24,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.02),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.8,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.07,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery
                              .of(context)
                              .size
                              .height * 0.05,
                        ),
                        child: Container(
                          width: 2.0,
                          height: 13.0,
                          child: VerticalDivider(
                            color: Colors.white24,
                            thickness: 3.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery
                                .of(context)
                                .size
                                .height * 0.037,
                          ),
                          child: Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.8,
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.07,
                            alignment: Alignment.centerRight,
                            // Adjust the alignment as needed
                            child: TextField(
                              controller: _textEditingController3,
                              style: TextStyle(
                                color: Colors.white24,
                                fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.03,
                              ),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: 'EMAIL ADDRESS',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.white24,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),

                        ),



                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery
                              .of(context)
                              .size
                              .height * 0.05,
                        ),
                        child: Container(
                          width: 2.0,
                          height: 13.0,
                          child: VerticalDivider(
                            color: Colors.white24,
                            thickness: 3.0,
                          ),
                        ),
                      ),

                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.white24,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.02),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.8,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.07,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery
                              .of(context)
                              .size
                              .height * 0.05,
                        ),
                        child: Container(
                          width: 2.0,
                          height: 13.0,
                          child: VerticalDivider(
                            color: Colors.white24,
                            thickness: 3.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery
                                .of(context)
                                .size
                                .height * 0.037,
                          ),
                          child:Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.07,
                            alignment: Alignment.centerRight,
                            // Adjust the alignment as needed
                            child: TextField(
                              controller: _textEditingController4,
                              style: TextStyle(
                                color: Colors.white24,
                                fontSize: MediaQuery.of(context).size.height * 0.03,
                              ),
                              textAlign: TextAlign.center,
                              obscureText: true, // Set obscureText to true
                              decoration: InputDecoration(
                                hintText: 'PASSWORD',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.white24,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),


                        ),



                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery
                              .of(context)
                              .size
                              .height * 0.05,
                        ),
                        child: Container(
                          width: 2.0,
                          height: 13.0,
                          child: VerticalDivider(
                            color: Colors.white24,
                            thickness: 3.0,
                          ),
                        ),
                      ),

                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.white24,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.02),
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.05,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.9,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ALWAYS LOGIN',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: MediaQuery
                              .of(context)
                              .size
                              .height * 0.018,
                        ),
                      ),

                    ],
                  ),
                ),
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.05,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.9,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ALLOW SEARCH',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: MediaQuery
                              .of(context)
                              .size
                              .height * 0.018,
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.03),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: InkWell(
                    onTap: () {
                      DataStorage.imagePath = _imagePath!;
                      DataStorage.stringData = _textEditingController.text;
                      DataStorage.stringData2 = _textEditingController2.text;
                      DataStorage.stringData3= _textEditingController3.text;
                      DataStorage.stringData4 = _textEditingController4.text;


                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Mainlist(imagePath1: _imagePath!,
                          stringData: _textEditingController.text,
                          stringData2: _textEditingController2.text,
                          stringData3: _textEditingController3.text,
                          stringData4: _textEditingController4.text,)),
                      );
                    },
                    child: Image.asset('assets/Asset 10.png'),
                  ),
                ),

              ],
            ),
          ),
          ]
      ),
    );
  }

}