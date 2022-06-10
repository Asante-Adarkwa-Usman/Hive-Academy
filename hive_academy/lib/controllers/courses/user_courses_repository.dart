import 'dart:convert';
import 'package:hive_academy/utils/storage_box/storage_constant.dart';
import 'package:hive_academy/utils/url.dart';
import 'package:http/http.dart' as http;

class UserCoursesRepository {
  loadUserCoursesFromApi() async {
    var userProfile = storageBox.read('userDetailsKey');
    var userId = userProfile['user_id'];
    var token = storageBox.read('userToken');

    var url = baseURL + '/users/' + userId + '/courses';
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + token,
        },
      );
      if (response.statusCode == 200) {
        var userCourses = json.decode(response.body);
        return userCourses;
      } else {
        throw Exception('Failed to load user courses');
      }
    } catch (e) {
      throw Exception('Failed to load user courses');
    }
  }
}
