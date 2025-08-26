import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ppkd_b_3/day_23/model/user_model.dart';

Future<List<UserModel>> getUser() async {
  final response = await http.get(
    Uri.parse("https://reqres.in/api/users?page=2"),
  );
  if (response.statusCode == 200) {
    final List<dynamic> userJson = json.decode(response.body)["data"];
    return userJson.map((json) => UserModel.fromJson(json)).toList();
  } else {
    throw Exception("Gagal memuat data");
  }
}
