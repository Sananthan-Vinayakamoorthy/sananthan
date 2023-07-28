import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  PickedFile? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: source);
    setState(() {
      _imageFile = pickedImage;
    });
  }

  Future<void> _registerUser() async {
    if (_imageFile != null) {
      // Upload the image first
      var imageUploadRequest = http.MultipartRequest('POST', Uri.parse('https://your-api-url.com/upload'));
      imageUploadRequest.files.add(await http.MultipartFile.fromPath('image', _imageFile!.path));

      var imageResponse = await imageUploadRequest.send();
      // Handle image upload response if needed
    }

    // Registration data
    var registrationData = {
      'name': _nameController.text,
      'email': _emailController.text,
      'password': _passwordController.text,
      // You can also send other registration data to the server as needed
    };

    // Send registration data to the server
    var registrationResponse = await http.post(
      Uri.parse('https://your-api-url.com/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(registrationData),
    );

    // Handle registration response and proceed accordingly
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

void main() {
  runApp(MaterialApp(
    home: RegistrationScreen(),
  ));
}
