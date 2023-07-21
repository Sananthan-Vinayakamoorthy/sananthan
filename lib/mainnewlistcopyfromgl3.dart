import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gl3_final/header_and_futter_widget.dart';
import 'containerdeleteit.dart';
import 'userlogin.dart';
import 'userlogin.dart';

import 'data_storage.dart';
import 'packingHunting.dart';
import 'dart:io';
import 'userlogin.dart';
import 'PROFILECONTAINER.dart';

class Mainlist extends StatefulWidget {
  final String imagePath1;
  final String stringData;
  final String stringData2;
  final String stringData3;
  final String stringData4;

  const Mainlist({
    required this.imagePath1,
    required this.stringData,
    required this.stringData2,
    required this.stringData3,
    required this.stringData4,
  });

  @override
  _MainlistState createState() => _MainlistState();


}

class _MainlistState extends State<Mainlist> with SingleTickerProviderStateMixin {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool showPopUp = false;
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  String get imagePath1 => widget.imagePath1;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: Offset(0, 0.5), // Start from bottom-right corner
      end: Offset(0, 0), // Move to top-left corner
    ).animate(_animationController);

    // Add delays to the animations
    Future.delayed(Duration(seconds: 1), () {
      _animationController.forward();
    });

    Future.delayed(Duration(seconds: 1), () {
      _animationController.forward();
    });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        showPopUp = true;
        _animationController.forward();
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/headerthanu.png'),
                  fit: BoxFit.cover,
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 85,
                      height: 45,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF060606), // Starting color (#060606)
                            Color(0xFF19191B), // Ending color (#19191B)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: FileImage(File(widget.imagePath1)), // Load image from file
                                  backgroundColor: Colors.transparent, // Set background color to transparent
                                  child: ClipOval(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Add spacing between the circular avatar and the container
                    Container(
                      width: 50,
                      height: 47,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF060606), // Starting color (#060606)
                            Color(0xFF19191B), // Ending color (#19191B)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Align(
                  alignment: Alignment.center,
                  child: FractionallySizedBox(
                    widthFactor: 0.45, // Adjust the width factor as desired
                    heightFactor: 0.28, // Adjust the height factor as desired
                    child: SlideTransition(
                      position: _animation,
                      child: Visibility(
                        visible: showPopUp,
                        child: Container(
                          width: 200, // Adjust the width as desired
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => AnimationBackgroundlast()),
                                  );
                                },
                                child: Container(
                                  color: Colors.black,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'New List',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.add,
                                            size: 80,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            footerContainer(context),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ContainerData(
              imagePath: DataStorage.imagePath,
              stringData: DataStorage.stringData,
              stringData2: DataStorage.stringData2,
              stringData3: DataStorage.stringData3,
              onEditProfileTap: navigateToUserPage,
            ),
          ],
        ),
      ),

    );
  }
  void navigateToUserPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Userpage()),
    );
  }
}
