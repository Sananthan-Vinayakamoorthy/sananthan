import 'package:flutter/material.dart';
import 'dart:io';
import 'containerpassing.dart';
import 'copyofuserpagegl3.dart';
import 'datastoragecopygl3.dart';


class ContainerData extends StatefulWidget {
  final String? imagePath;
  final String? stringData;
  final String? stringData2;
  final String? stringData3;
  final String? stringData4;

  final VoidCallback? onEditProfileTap;

  ContainerData({this.imagePath, this.stringData, this.stringData2, this.stringData3, this.stringData4, this.onEditProfileTap});

  @override
  _ContainerDataState createState() => _ContainerDataState();
}

class _ContainerDataState extends State<ContainerData> {
  bool switchValue = true;
  bool switchValue1 = true;
  bool switchValue2 = true;

  void onEditProfileTap() {
    // Implement the navigation logic here
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Userpage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 1),
      height: 810,
      width: 400,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [

          Row(
            children: [
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                  image: DecorationImage(
                    image: FileImage(File(widget.imagePath ?? '')),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10, height: 150),
              Container(
                child: Container(
                  width: 90,
                  height: 90,

                  child: Center(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              ' ${widget.stringData ?? ''}',
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            ' ${widget.stringData2 ?? ''}',
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            ' ${widget.stringData3 ?? ''}',
                            style: TextStyle(fontSize: 12),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1),
          Container(
            color: Colors.white70,
            height: 1,
            width: 280,
          ),
          SizedBox(height: 20),
          Container(
            color: Colors.transparent,
            height: 55,
            width: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/button_edit_categories.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  width: 180,
                  height: 25,
                  color: Colors.transparent,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontFamily: 'YourFontFamily',
                      fontSize: 18,
                      // Other text style properties
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'EDIT CATEGORIES',
                      hintStyle: TextStyle(color: Colors.deepOrange),
                    ),
                  ),
                ),
                SizedBox(width: 2),
                Container(
                  width: 18,
                  height: 18,
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/orange_arrow.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.transparent,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 35,
                  height: 30,
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/button_allow_camera.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 175,
                  height: 25,
                  color: Colors.transparent,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontFamily: 'YourFontFamily',
                      fontSize: 18,
                      // Other text style properties
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'ALLOW CAMERA',
                      hintStyle: TextStyle(color: Colors.deepOrange),
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  height: 30,
                  color: Colors.transparent,
                  child: Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      activeColor: Colors.deepOrange,
                      value: switchValue,
                      onChanged: (value) {
                        setState(() {
                          switchValue = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.transparent,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 30,
                  height: 25,
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/button_allow_pictures.png',
                    fit: BoxFit.cover,
                  ),
                ),

                Container(
                  width: 185,
                  height: 25,
                  color: Colors.transparent,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontFamily: 'YourFontFamily',
                      fontSize: 18,
                      // Other text style properties
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'ALLOW PICTURES',
                      hintStyle: TextStyle(color: Colors.deepOrange),
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  height: 30,
                  color: Colors.transparent,
                  child: Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      activeColor: Colors.deepOrange,
                      value: switchValue1,
                      onChanged: (value) {
                        setState(() {
                          switchValue1 = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.transparent,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 35,
                  height: 34,
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/button_allow_search.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 175,
                  height: 25,
                  color: Colors.transparent,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontFamily: 'YourFontFamily',
                      fontSize: 18,
                      // Other text style properties
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'ALLOW SEARCH',
                      hintStyle: TextStyle(
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  height: 30,
                  color: Colors.transparent,
                  child: Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      activeColor: Colors.deepOrange,
                      value: switchValue2,
                      onChanged: (value) {
                        setState(() {
                          switchValue2 = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            color: Colors.white70,
            height: 1,
            width: 280,
          ),
          SizedBox(height: 30),
          Container(
            color: Colors.transparent,
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 30),
                  width: 210,
                  height: 30,
                  color: Colors.transparent,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontFamily: 'YourFontFamily',
                      fontSize: 14,
                      // Other text style properties
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'NAVIGATION INFORMATION',
                      hintStyle: TextStyle(color: Colors.deepOrange),
                    ),
                  ),
                ),
                Container(
                  width: 20,
                  height: 20,
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/orange_arrow.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 28),
          Container(
            color: Colors.transparent,
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 35),
                  width: 205,
                  height: 25,
                  color: Colors.transparent,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.cyan,
                      fontFamily: 'YourFontFamily',
                      fontSize: 14,
                      // Other text style properties
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'TUTORIAL LINK',
                      hintStyle: TextStyle(color: Colors.deepOrange),
                    ),
                  ),
                ),
                Container(
                  width: 20,
                  height: 20,
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/info.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 75),
          Container(
            color: Colors.transparent,
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Inside the GestureDetector's onTap callback in your ContainerData widget

                GestureDetector(
                  onTap: onEditProfileTap, // Invoke the callback when tapped
                  child: Container(
                    margin: EdgeInsets.only(right: 35),
                    width: 205,
                    height: 25,
                    color: Colors.transparent,
                    child: TextField(
                      readOnly: true,
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontFamily: 'YourFontFamily',
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'EDIT PROFILE',
                        hintStyle: TextStyle(color: Colors.deepOrange),
                      ),
                    ),
                  ),
                ),







                Container(
                  width: 20,
                  height: 20,
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/orange_arrow.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          // Rest of your code...
        ],
      ),
    );

  }
}
