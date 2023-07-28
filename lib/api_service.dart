// user_api.dart

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> fetchUserData(int id) async {
  try {

    var response = await http.get(
      Uri.parse('https://gl3.intern-developers.innovay.com/api/user/${id}'),
    );
    print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
  print(response.statusCode);
    if (response.statusCode == 200) {

      print('-----------------------------------------------');
      print(jsonDecode(response.body)['data']['name']);
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch user data');
    }
  } catch (e) {
    throw Exception('Error occurred while fetching user data');
  }
}
