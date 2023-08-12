Map<String, String> parseProfile(Map<String, dynamic> data) {
  Map<String, String> profile = {};
  data.forEach((key, value) => profile[key] = value.toString());
  return profile;
}
