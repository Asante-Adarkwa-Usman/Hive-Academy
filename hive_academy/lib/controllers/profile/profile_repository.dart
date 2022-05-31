import 'dart:convert';
import 'package:hive_academy/utils/storage_box/storage_constant.dart';
import 'package:http/http.dart' as http;
import 'package:hive_academy/utils/url.dart';

class ProfileRepository {
  var tokenKey = storageBox.read('tokenKey');

  loadUserProfileFromApi() async {
    var url = userProfileURL;
    try {
      var response = await http.get(Uri.parse(url),
          headers: {'Authorization': 'Bearer ${tokenKey['token']}'});

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load user profile');
      }
    } catch (e) {
      throw Exception('Failed to load user profile');
    }
  }
}
