import 'dart:convert';

import 'package:bloc_api/models/user_model.dart';
import 'package:http/http.dart';

class WebServices {
  final String _url = 'https://reqres.in/api/users?page=2';

  Future<List<UserModel>?> fetchUserList() async {
    Response response = await get(Uri.parse(_url));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e) => UserModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
