import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiUrl = 'https://gl3.intern-developers.innovay.com/api/user';

  Future<dynamic> fetchData() async {
    try {
      final response = await http.post(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Data was successfully fetched
        return json.decode(response.body);
      } else {
        // Request failed with an error status code
        print('Request failed with status: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // Handle any errors that occurred during the API call
      print('Error: $e');
      return null;
    }
  }
}
