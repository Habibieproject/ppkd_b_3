import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:ppkd_b_3/day_25/api/endpoint/endpoint.dart';
import 'package:ppkd_b_3/day_30/model/categories_model.dart';
import 'package:ppkd_b_3/preference/shared_preference.dart';

class CategoriesAPI {
  static Future<CategoryResponse> postCategory({
    required String name,
    required File image,
  }) async {
    final url = Uri.parse(Endpoint.categories);
    final token = await PreferenceHandler.getToken();
    final readImage = image.readAsBytesSync();
    final b64 = base64Encode(readImage);
    final response = await http.post(
      url,
      body: {"name": name, "image": b64},
      headers: {"Accept": "application/json", "Authorization": token},
    );
    print(image);
    print(readImage);
    print(b64);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return CategoryResponse.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"] ?? "Register gagal");
    }
  }
}
