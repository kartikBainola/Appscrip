import 'dart:convert';
import '../Model/Model_User.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<List<Users>> getUser() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Users> users =
          body.map((dynamic client) => Users.fromJson(client)).toList();
      users.sort((a, b) => a.name.compareTo(b.name));
      return users;
    } else {
      throw Exception('failed to load users');
    }
  }
}
