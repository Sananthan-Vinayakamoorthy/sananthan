import 'dart:io';
import 'package:flutter/material.dart';
import 'pic.move.dart';


Widget headerContainer(BuildContext context, {String? imagePath}) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.1,
    child: FractionallySizedBox(
      widthFactor: 1.0,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/headerthanu.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
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
                child: CircleAvatar(
                  radius: 13,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: SizedBox(
                      width: 26,
                      height: 26,
                      child: Image.file(
                        File(imagePath ?? ''), // Use imagePath parameter
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
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
              // ... other header widgets
            ],
          ),
        ),
      ),

    ),
  );
}




Widget footerContainer(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.12,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/footer.png'),
        fit: BoxFit.cover,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              // Handle icon tap
            },
            icon: Image.asset('assets/Asset5.png'),
            iconSize: 50.0,
          ),
          IconButton(
            onPressed: () {
              // Handle icon tap
            },
            icon: Image.asset('assets/Asset4.png'),
            iconSize: 45.0,
          ),
          IconButton(
            onPressed: () {
              // Handle icon tap
            },
            icon: Image.asset('assets/Asset 1@2x.png'),
            iconSize: 80.0,
            padding: EdgeInsets.only(bottom: 20.0),
          ),
          IconButton(
            onPressed: () {
              // Handle icon tap
            },
            icon: Image.asset('assets/Asset2.png'),
            iconSize: 45.0,
          ),
          IconButton(
            onPressed: () {
              // Handle icon tap
            },
            icon: Image.asset('assets/Asset3.png'),
            iconSize: 60.0,
          ),
        ],
      ),
    ),
  );
}

