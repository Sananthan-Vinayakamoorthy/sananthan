import 'package:cameara_on/apiconection.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RegistrationScreen(),
  ));
}

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String? _imagePath;

  Future<void> _registerUser() async {
    var registrationData = {
      'name': _nameController.text,
      'email': _emailController.text,
      'password': _passwordController.text,
      'image': _imagePath, // Use the image path from the image picker
    };

    try {
      var registrationResponse = await _registerUserRequest(registrationData);
      // Check the status code of the response
      print("------------------------------------------------------------");
      print(registrationResponse.statusCode);
      if (registrationResponse.statusCode == 200) {
        var responseData = jsonDecode(registrationResponse.body);
        int id = responseData['data']['id'] ;

        print(registrationResponse.body);
        _showSnackbar('Registration successful');
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>SomePage(id: id)));
        // You can navigate to another screen or perform any other action here
      } else {
        _showSnackbar('Registration failed');
      }
    } catch (e) {
      _showSnackbar('Error occurred during registration');
    }
  }

  Future<http.Response> _registerUserRequest(Map<String, dynamic> data) async {
    // Send user registration data to the server
    var registrationResponse = await http.post(
      Uri.parse('https://gl3.intern-developers.innovay.com/api/user'), // Replace with your API endpoint
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    return registrationResponse;
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _pickImage(ImageSource source) async {
    final imagePicker = ImagePicker();
    try {
      final pickedImage = await imagePicker.pickImage(source: source);
      setState(() {
        if (pickedImage != null) {
          _imagePath = pickedImage.path;
        }
      });
    } catch (e) {
      _showSnackbar('Error picking image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Name')),
            TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password')),
            SizedBox(height: 16),
            _imagePath == null
                ? Text('No image selected.')
                : Image.file(File(_imagePath!), height: 100, width: 100),
            SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _pickImage(ImageSource.camera),
                  child: Text('Take Picture'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => _pickImage(ImageSource.gallery),
                  child: Text('Pick Image'),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _registerUser,
              child: Text('Register'),

            ),
          ],
        ),
      ),
    );
  }
}