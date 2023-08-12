Map<String, String> parseSemID(Map<String, dynamic> data) {
  Map<String, String> semIDs = {};
  data.forEach((key, value) => semIDs[key] = value.toString());
  return semIDs;
}
