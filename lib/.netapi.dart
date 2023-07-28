import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class MyApp extends StatelessWidget {
  final String apiUrl = 'https://gl3.intern-developers.innovay.com/api/user';
  // Replace with your API endpoint

  Future<List<Map<String, dynamic>>> fetchData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        // Successful response
        List<dynamic> data = jsonDecode(response.body);
        return data.cast<Map<String, dynamic>>();
      } else {
        // Handle other status codes or errors
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any other exceptions or errors
      throw Exception('Failed to fetch data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter HTTP Example'),
        ),
        body: Center(
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final data = snapshot.data;
                // Process and display the fetched data here
                if (data != null) {
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('${data[index]['name']}, ${data[index]['id']}'),
                      );
                    },
                  );
                } else {
                  return Text('No data received.');
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
