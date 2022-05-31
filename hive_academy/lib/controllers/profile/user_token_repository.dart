import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hive_academy/utils/storage_box/storage_constant.dart';
import 'package:hive_academy/utils/url.dart';

class UserTokenRepository {
  loadUserTokenFromApi() async {
    var url = userTokenURL;
    String userEmail = storageBox.read('userEmail');
    String userPassword = storageBox.read('userPassword');

    try {
      var tokenKey = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Basic ' + base64Encode(utf8.encode('$userEmail:$userPassword'))
        },
        body: jsonEncode({
          'email': userEmail,
          'password': userPassword,
        }),
      );

      if (tokenKey.statusCode == 200) {
        storageBox.write('tokenKey', tokenKey.body);
        return json.decode(tokenKey.body);
      } else {
        throw Exception('Failed to load user token');
      }
    } catch (e) {
      throw Exception('Failed to load user token');
    }
  }
}
