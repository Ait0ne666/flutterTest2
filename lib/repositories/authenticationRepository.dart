import 'dart:convert';

import 'package:loginFlowTest/models/User.dart';
import "package:http/http.dart" as http;

abstract class AuthenticationRepository {
  Future<User> login(String username, String password);
}

class FakeAuthenticationRepository implements AuthenticationRepository {
  User _user = null;

  Future<User> login(String username, String password) async {
    final response = await http.get('https://randomuser.me/api/');

    if (response.statusCode == 200) {
      try {
        return User.fromJson(jsonDecode(response.body));
      } catch (error) {
        print(error);
        throw Exception('Failed to load');
      }
    } else {
      throw Exception('Failed to load url');
    }
  }
}
