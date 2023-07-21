import 'dart:io';

import 'package:flutter/material.dart';

class NextPage2 extends StatelessWidget {
  final String imagePath;

  NextPage2({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Preview'),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            color: Colors.blue, // Set the desired background color for the header container
            child: Center(
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.white, // Set the desired background color for the circular avatar
                child: ClipOval(
                  child: SizedBox(
                    width: 160,
                    height: 160,
                    child: Image.file(
                      File(imagePath),
                      fit: BoxFit.cover, // Adjust the image inside the circular avatar
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: Container(
                color: Colors.black,
                height: 40,
                width: 50,
                child: InkWell(
                  onTap: () {


                    // Handle the tap gesture here
                  },
                  child: Container(
                    // Add the rest of your UI here
                  ),
                ),
              )

          ),
        ],
      ),
    );
  }
}