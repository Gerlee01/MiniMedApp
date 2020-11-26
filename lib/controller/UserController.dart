import 'dart:convert';
import 'dart:io';

import 'file:///D:/diploma/project/mini_med_front/lib/util/LoginRequest.dart';
import 'package:mini_med_front/entity/User.dart';
import 'package:mini_med_front/util/MConstants.dart';

class UserController {
  Future<List<User>> findAll() async {
    String url = MConstants.mainService + "/user/all";
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    request.headers.set('Authorization', 'Bearer ' + MConstants.token);
    HttpClientResponse response = await request.close();
    if (response.statusCode != 200) return null;
    List<dynamic> body =
        jsonDecode(await response.transform(utf8.decoder).join());
    return body.map((dynamic item) => User.fromJson(item)).toList();
  }

  Future<User> findByUsernameAndPassword(String username, String password) async {
    String url = MConstants.mainService + "/user/me";
    getToken(username, password);
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    request.headers.set('Authorization', 'Bearer ' + MConstants.token);
    HttpClientResponse response = await request.close();
    if (response.statusCode != 200) {
      return null;
    }
    Map<String, dynamic> map =
        json.decode(await response.transform(utf8.decoder).join());
    httpClient.close();
    return User.fromJson(map);
  }

  void getToken(String username, String password) async {
    String url = MConstants.mainService + "/auth/login";
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(
        LoginRequest(username: username, password: password).toJson())));
    HttpClientResponse response = await request.close();
    Map<String, dynamic> map =
        json.decode(await response.transform(utf8.decoder).join());
    httpClient.close();
    MConstants.setToken(map['accessToken']);
  }
}
