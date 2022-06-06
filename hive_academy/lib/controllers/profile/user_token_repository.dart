import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hive_academy/utils/url.dart';

class UserTokenRepository {
  loadUserTokenFromApi(String userEmail, String userPassword) async {
    var url = userTokenURL;

    try {
      var userToken = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Basic ' + base64Encode(utf8.encode('$userEmail:$userPassword')),
        },
      );
      if (userToken.statusCode == 200) {
        Map<String, dynamic> userTokenMap = json.decode(userToken.body);
        return userTokenMap;
      } else {
        throw Exception('Failed to load user token');
      }
    } catch (e) {
      throw Exception('Failed to load user token');
    }
  }
}
