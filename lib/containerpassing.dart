import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'data_storage.dart';

class ContainerData extends StatelessWidget {
  final String? imagePath;
  final String? stringData;
  final String? stringData2;
  final String? stringData3;
  final String? stringData4;

  const ContainerData({this.imagePath, this.stringData, this.stringData2, this.stringData3, this.stringData4});

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
            height: 90,
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
                    ' ${stringData2 ?? ''}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    ' ${stringData3 ?? ''}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    ' ${stringData4 ?? ''}',
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