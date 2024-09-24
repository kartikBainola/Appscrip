import 'dart:convert';
import '../Model/Model_User.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<List<Users>> getUser() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Users> employee =
          body.map((dynamic client) => Users.fromJson(client)).toList();
      employee.sort((a, b) => a.name.compareTo(b.name));
      return employee;
    } else {
      throw Exception('failed to load users');
    }
  }
}
