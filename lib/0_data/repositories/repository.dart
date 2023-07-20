import 'package:http/http.dart' as http;
import 'package:vtop_app/0_data/constants.dart';

import 'package:vtop_app/0_data/models/timetable.dart';

abstract class Repository {
  Future<Timetable> getTimetable(String username, String password);
}

class APIRepository extends Repository {
  @override
  Future<Timetable> getTimetable(String username, String password) async {
    return Timetable.fromJson((await http.post(Uri.parse(timetableURL),
            body: {'username': username, 'password': password}))
        .body);
  }
}
