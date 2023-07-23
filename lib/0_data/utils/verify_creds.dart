import 'package:http/http.dart' as http;
import 'package:vtop_app/0_data/constants.dart';

Future<bool> isValid(String username, String password) async {
  var req = await http.post(Uri.parse(verifyURL),
      body: getPostBody(username, password));
  if (req.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
