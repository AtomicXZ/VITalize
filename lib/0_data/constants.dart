// api base url
part 'priv_constants.dart';

// api endpoint constants
const String verifyEndPoint = '/api/verify';
const String profileEndPoint = '/api/profile';
const String attendanceEndPoint = '/api/attendance';
const String timetableEndPoint = '/api/timetable';
const String semIDsEndPoint = '/api/semIDs';
const String allEndPoint = '/api/all';

// api url constants
const String verifyURL = '$baseURL$verifyEndPoint';
const String profileURL = '$baseURL$profileEndPoint';
const String attendanceURL = '$baseURL$attendanceEndPoint';
const String timetableURL = '$baseURL$timetableEndPoint';
const String semIDsURL = '$baseURL$semIDsEndPoint';
const String allURL = '$baseURL$allEndPoint';

// hive box names
const String timetableBoxName = 'timetableBox';
const String attendanceBoxName = 'attendanceBox';
const String profileBoxName = 'profileBox';
const String semIDsBoxName = 'semIDsBox';

// api post body for requests
Map<String, String> getPostBody(String username, String password) {
  return {
    'username': username,
    'password': password,
  };
}
