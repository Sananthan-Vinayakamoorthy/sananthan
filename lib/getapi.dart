import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class YourScreen extends StatelessWidget {
  // Your code here

  // Function to fetch data from the server using POST method
  Future<void> fetchDataFromServer() async {
    var apiUrl = 'https://your-api-endpoint.com/your-post-route'; // Replace with your API endpoint

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          // Add your request parameters here if needed
          'key': 'value',
        }),
      );

      if (response.statusCode == 200) {
        // If the request is successful, parse the response body
        var data = jsonDecode(response.body);
        // Process the data as needed
        print(data);
      } else {
        // If the request is not successful, handle the error
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any other errors that may occur during the request
      print('Error occurred: $e');
    }
  }

  @override

}
