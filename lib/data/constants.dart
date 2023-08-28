// api base url
part 'priv_constants.dart';

// api endpoint constants
const String verifyEndPoint = '/api/verify';
const String profileEndPoint = '/api/profile';
const String attendanceEndPoint = '/api/attendance';
const String timetableEndPoint = '/api/timetable';
const String semIDsEndPoint = '/api/semIDs';
const String marksEndPoint = '/api/marks';
const String gradesEndPoint = '/api/grades';
const String examScheduleEndPoint = '/api/examSchedule';
const String allEndPoint = '/api/all';

// api url constants
const String verifyURL = '$baseURL$verifyEndPoint';
const String profileURL = '$baseURL$profileEndPoint';
const String attendanceURL = '$baseURL$attendanceEndPoint';
const String timetableURL = '$baseURL$timetableEndPoint';
const String semIDsURL = '$baseURL$semIDsEndPoint';
const String marksURL = '$baseURL$marksEndPoint';
const String gradesURL = '$baseURL$gradesEndPoint';
const String examScheduleURL = '$baseURL$examScheduleEndPoint';
const String allURL = '$baseURL$allEndPoint';

// hostel sophos client urls
const String hostelWifiLoginURL = 'https://hfw.vitap.ac.in:8090/login.xml';
const String hostelWifiLogoutURL = 'https://hfw.vitap.ac.in:8090/logout.xml';

// hive box names
const String userBoxName = 'userBox';
const String timetableBoxName = 'timetableBox';
const String attendanceBoxName = 'attendanceBox';
const String profileBoxName = 'profileBox';
const String semIDsBoxName = 'semIDsBox';
const String gradesBoxName = 'gradesBox';
const String examScheduleBoxName = 'examScheduleBox';

// last updated time keys
const String allDataLastUpdated = 'allDataLastUpdated';
const String attendanceLastUpdated = 'attendanceLastUpdated';
const String gradesLastUpdated = 'gradesLastUpdated';
const String examScheduleLastUpdated = 'examScheduleLastUpdated';
