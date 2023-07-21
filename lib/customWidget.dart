import 'package:flutter/material.dart';
import 'data_storage2.dart';

import 'newitemlist.dart';
final TextEditingController _textEditingController = TextEditingController();
final TextEditingController _textEditingController2 = TextEditingController();
final TextEditingController _textEditingController3 = TextEditingController();
final TextEditingController _textEditingController4 = TextEditingController();




const Color myGrey = Color(0xFF2D2D2D);
const Color myBlack  = Color(0xFF231F20);
const Color myhash =Color(0xFF929091);
const Color mycamera=Color(0xFF161616);

Widget customTextField() {
  return TextField(
    cursorColor: Colors.white,
    style:TextStyle (
      color: Colors.white
      ,
    ),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'Enter text here',
      hintStyle: TextStyle(
        color: Colors.white,
      ),
      contentPadding: EdgeInsets.all(8.0),
    ),
  );
}
double getResponsiveWidth(BuildContext context, double percentage) {
  final screenWidth = MediaQuery.of(context).size.width;
  return screenWidth * percentage;
}
double getResponsiveHeight(BuildContext context, double percentage) {
  final screenHeight = MediaQuery.of(context).size.height;
  return screenHeight * percentage;
}
double getAvailableHeight(BuildContext context, double percentage) {
  final screenHeight = MediaQuery.of(context).size.height;
  final padding = MediaQuery.of(context).padding;
  return (screenHeight - padding.top - padding.bottom)* percentage;
}

Widget inputContainer1(BuildContext context, {required String labelText}) {
  final double containerWidth = getResponsiveWidth(context, 0.85);
  final double containerHeight = getAvailableHeight(context, 0.045);
  return Container(
    width: containerWidth,
    height: containerHeight,
    decoration: BoxDecoration(
      color: myGrey,
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
  );
}


Widget inputContainer2(BuildContext context, {required String labelText}) {
  final double containerWidth = getResponsiveWidth(context, 0.85);
  final double containerHeight = getAvailableHeight(context, 0.045);
  return Container(
    width: containerWidth,
    height: containerHeight,
    decoration: BoxDecoration(
      color: myGrey,
      borderRadius: BorderRadius.circular(10),
    ),
    padding: EdgeInsets.only(left: 20),
    child: Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
          child:  TextField(

            controller: _textEditingController2,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'NAME:',
              hintStyle: TextStyle(
                color: Colors.white54,
              ),
              border: InputBorder.none,
            ),
            onChanged: (value) {
              DataStorage.stringData2 = value; // Store the entered text in the DataStorage class
            },
          ),
        ),
        Flexible(
          child: customTextField(),
        ),
      ],
    ),
  );
}
Widget inputContainer3(BuildContext context, {required String labelText}) {
  final double containerWidth = getResponsiveWidth(context, 0.85);
  final double containerHeight = getAvailableHeight(context, 0.045);
  return Container(
    width: containerWidth,
    height: containerHeight,
    decoration: BoxDecoration(
      color: myGrey,
      borderRadius: BorderRadius.circular(10),
    ),
    padding: EdgeInsets.only(left: 20),
    child: Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
          child:  TextField(

            controller: _textEditingController3,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'WEIGHT:',
              hintStyle: TextStyle(
                color: Colors.white54,
              ),
              border: InputBorder.none,
            ),
            onChanged: (value) {
              DataStorage.stringData3 = value; // Store the entered text in the DataStorage class
            },
          ),
        ),
        Flexible(
          child: customTextField(),
        ),
      ],
    ),
  );
}
Widget inputContainer4(BuildContext context, {required String labelText}) {
  final double containerWidth = getResponsiveWidth(context, 0.85);
  final double containerHeight = getAvailableHeight(context, 0.045);
  return Container(
    width: containerWidth,
    height: containerHeight,
    decoration: BoxDecoration(
      color: myGrey,
      borderRadius: BorderRadius.circular(10),
    ),
    padding: EdgeInsets.only(left: 20),
    child: Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
          child:  TextField(

            controller: _textEditingController4,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'WEIGHT:',
              hintStyle: TextStyle(
                color: Colors.white54,
              ),
              border: InputBorder.none,
            ),
            onChanged: (value) {
              DataStorage.stringData4 = value; // Store the entered text in the DataStorage class
            },
          ),
        ),
        Flexible(
          child: customTextField(),
        ),
      ],
    ),
  );
}

Widget cameraContainer(BuildContext context){

  return  Container(

    // height: 150,
    width: 150,
    // Replace with your desired background color
    decoration: BoxDecoration(
      border: Border.all(
        color: myhash,
        width: 1.0,
      ),
      color: myBlack,
    ),
    child: Center(
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
  );
}



Widget titleContainer(BuildContext context){
  final conheight = getResponsiveHeight(context, 0.065);
  return Container(

    padding: EdgeInsets.only(
      left: 10,

    ),
    //height:150 ,
    //width:200,
    // Replace with your desired background color
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Container(

          height: 40,
          child:Text(
            '[TITLE]',
            style:TextStyle(

              fontSize: 40, // Set the font size
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),

          ),

        ),
        SizedBox(height: 1.0),
        Container(


          child:Text(
            '[WHERE]',
            style: TextStyle(
              fontSize: 15, // Set the font size
              color: Colors.white,
            ),

          ),
        ),
        SizedBox(height: conheight),
        Container(

          height: 15, // Set the desired height of the container
          //  color: Colors.grey,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: FractionalTranslation(
              translation: Offset(0, 0), // Adjust the Y offset as needed to position the text
              child: Text(
                '[DATE]',
                style: TextStyle(fontSize: 15,
                    color: Colors.black
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}