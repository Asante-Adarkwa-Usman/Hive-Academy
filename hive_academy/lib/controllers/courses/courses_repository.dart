import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hive_academy/utils/url.dart';

class CoursesRepository {
  var url = coursesURL;
  loadCoursesFromApi() async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load courses');
      }
    } catch (e) {
      throw Exception('Failed to load courses');
    }
  }
}
