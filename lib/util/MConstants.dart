class MConstants {
  static final String mainService =
      "http://124.158.110.117:4005/api"; //Үндсэн service

  static String token = ""; //token

  static void setToken(String _token) {
    token = _token;
  }

  static String getToken() {
    return token;
  }
}
