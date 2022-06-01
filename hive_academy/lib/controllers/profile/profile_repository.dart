import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:hive_academy/controllers/profile/user_token_repository.dart';
import 'package:hive_academy/utils/storage_box/storage_constant.dart';
import 'package:http/http.dart' as http;
import 'package:hive_academy/utils/url.dart';

class ProfileRepository {
  final UserTokenRepository userTokenRepository = UserTokenRepository();

  loadUserProfileFromApi() async {
    var url = userProfileURL;
    Map<String, dynamic> token = storageBox.read('tokenKey');
    //print('From ProfileRepository' + token.toString());
    try {
      var response = await http.get(Uri.parse(url),
          headers: {'Authorization': 'Bearer ${token['token']}'});

      if (response.statusCode == 200) {
        var userDetails = json.decode(response.body);
        print(userDetails);
        storageBox.write('userDetails', userDetails);
        storageBox.write('userEmail', userDetails['email']);
        return userDetails;
      } else {
        throw Exception('Failed to load user profile');
      }
    } catch (e) {
      throw Exception('Failed to load user profile');
    }
  }
}
