part 'priv_constants.dart';

const String verifyEndPoint = '/api/verify';
const String profileEndPoint = '/api/profile';
const String attendanceEndPoint = '/api/attendance';
const String timetableEndPoint = '/api/timetable';
const String allEndPoint = '/api/all';

const String verifyURL = '$baseURL$verifyEndPoint';
const String profileURL = '$baseURL$profileEndPoint';
const String attendanceURL = '$baseURL$attendanceEndPoint';
const String timetableURL = '$baseURL$timetableEndPoint';
const String allURL = '$baseURL$allEndPoint';

Map<String, String> getPostBody(String username, String password) {
  return {
    'username': username,
    'password': password,
  };
}
