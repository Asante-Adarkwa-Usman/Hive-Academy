import 'dart:convert';
import 'package:hive_academy/controllers/profile/user_token_repository.dart';
import 'package:hive_academy/utils/storage_box/storage_constant.dart';
import 'package:http/http.dart' as http;
import 'package:hive_academy/utils/url.dart';

class ProfileRepository {
  final UserTokenRepository userTokenRepository = UserTokenRepository();

  loadUserProfileFromApi(String email, String password) async {
    var url = userProfileURL;

    try {
      var token =
          await userTokenRepository.loadUserTokenFromApi(email, password);
      storageBox.write('userToken', token['token']);

      var userProfile = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + token['token'],
        },
      );
      if (userProfile.statusCode == 200) {
        Map<String, dynamic> userProfileMap = json.decode(userProfile.body);
        return userProfileMap;
      } else {
        throw Exception('Failed to load user profile');
      }
    } catch (e) {
      throw Exception('Failed to load user profile');
    }
  }
}
