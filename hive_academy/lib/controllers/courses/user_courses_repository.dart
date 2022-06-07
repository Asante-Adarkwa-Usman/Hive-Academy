import 'dart:convert';
import 'package:hive_academy/utils/storage_box/storage_constant.dart';
import 'package:http/http.dart' as http;

class UserCoursesRepository {
  loadUserCoursesFromApi() async {
    var userProfile = storageBox.read('userProfile');
    var userId = userProfile['user_id'];
    print(userId);
    try {
      var url =
          ' https://hive-academy-mlynshzqlq-uc.a.run.app/api/v2/users/$userId/courses';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var userData = json.decode(response.body);
        return userData;
      } else {
        throw Exception('Failed to load user courses');
      }
    } catch (e) {
      throw Exception('Failed to load user courses');
    }
  }
}
