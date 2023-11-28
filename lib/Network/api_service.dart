import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import '../Model/User.dart';

class APIService {
  String endpoint = 'https://reqres.in/api/users';
  static var client = http.Client();

  Future<List<User>> getUser() async {
    Response response = await get(Uri.parse(endpoint));

    // Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    //
    // var url = Uri.https("reqres.in", "/api/users");
    //
    // var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      print(response.statusCode);
      debugPrint(response.toString());
      final List result = jsonDecode(response.body) ['data'];
      print(result.first);
      return result.map(
          ((e) => User.fromJson(e))).toList();
    }
    else {
      throw Exception(response.reasonPhrase);
    }
  }
}