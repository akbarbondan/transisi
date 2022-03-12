import 'dart:convert';

import 'package:testtransisi/model/models.dart';
import 'package:http/http.dart' as http;

class UserServices {
  static String url = "https://reqres.in/api/users?page=2";
  static List<User> allUser = [];
  static Future getUser() async {
    try {
      var respond = await http.get(Uri.parse(url));
      List data = (jsonDecode(respond.body) as Map<String, dynamic>)['data'];
      data.forEach((element) {
        allUser.add(User.fromJson(element));
      });
    } catch (e) {
      print(e);
    }
  }
}

class Login {
  static Future<String> postLogin(String email, String password) async {
    String url = "https://reqres.in/api/login";
    var respond = await http
        .post(Uri.parse(url), body: {"email": email, "password": password});

    if (respond.statusCode != 200) {
      return "Password email dan password";
    }
    var data = jsonDecode(respond.body);
    return data["token"];
  }
}
