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


  //PickedFile? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: source);
    setState(() {
      _imageFile = pickedImage;
    });
  }

  Future<void> _registerUser() async {
     try {
      if (_imageFile != null) {
        // Upload the image first
        var imageUploadRequest = http.MultipartRequest(
          'POST',
          Uri.parse('https://gl3.intern-developers.innovay.com/api/user'), // Replace with your API endpoint
        );
        imageUploadRequest.files.add(await http.MultipartFile.fromPath(
          'image',
          _imageFile!.path,
        ));

        // Send the image upload request to the server
        var imageResponse = await imageUploadRequest.send();
        // Handle image upload response if needed
        if (imageResponse.statusCode == 200) {
          // Image upload successful
          print('Image uploaded successfully');
        } else {
          // Image upload failed
          print('Failed to upload image');
          print('Status code: ${imageResponse.statusCode}');
          print('Response body: ${await imageResponse.stream.bytesToString()}');
          _showSnackbar('Failed to upload image');
          return;
        }
      }

      // Handle user registration response
      var registrationResponse = await _registerUserRequest();
      if (registrationResponse.statusCode == 200) {
        // Registration successful
        print('User registered successfully');
        _showSnackbar('User registered successfully');
        // Alternatively, show a dialog to inform the user about successful registration
      } else {
        // Registration failed
        print('Failed to register user');
        print('Status code: ${registrationResponse.statusCode}');
        print('Response body: ${registrationResponse.body}');
        _showSnackbar('Failed to register user');
        // Alternatively, show a dialog to inform the user about registration failure
      }
    }catch (e) {
      // Exception occurred during the API calls
      print('Error: $e');
      _showSnackbar('An error occurred');
    }
  }

  Future<http.Response> _registerUserRequest() async {
    var registrationData = {
      'name': _nameController.text,
      'email': _emailController.text,
      'password': _passwordController.text,


    };

    // Send user registration data to the server
    var registrationResponse = await http.post(
      Uri.parse('https://gl3.intern-developers.innovay.com/api/user'), // Replace with your API endpoint
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(registrationData),
    );

    return registrationResponse;
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
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
             _imageFile == null
               ? Text('No image selected.')
              : Image.file(File(_imageFile!.path), height: 100, width: 100),
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
