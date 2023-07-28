import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'api_service.dart';

class SomePage extends StatefulWidget {
  final int id;

  SomePage({required this.id});

  @override
  _SomePageState createState() => _SomePageState();
}

class _SomePageState extends State<SomePage> {
  Map<String, dynamic> _userData = {};
  bool isloaded =false;

  @override
  void initState() {
    super.initState();
    _fetchUserData().then((value) {setState(() {
      isloaded=true;
    });});

  }

  Future<void> _fetchUserData() async {
    try {
      var userData = await fetchUserData(widget.id);
      setState(() {
        _userData = userData;
      });
    } catch (e) {
      // Handle the error, display an error message, or navigate back if needed
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:isloaded? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${_userData['data']['name']}'),
            Text('Email: ${_userData['data']['email']}'),
            SizedBox(height: 16),
            _userData['data']['image'] == null
                ? Text('No image selected.')
                : Image.network(_userData['data']['image'], height: 100, width: 100),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Go back to the previous screen
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),
          ],
        ):SizedBox(height: 10),
      ),
    );
  }
}
