import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mini_med_front/component/user/model/LoginRequest.dart';
import 'package:mini_med_front/entity/User.dart';
import 'package:mini_med_front/util/MConstants.dart';

class UserController {
  get token => null;

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
    Map<String, dynamic> map = json.decode(await response.transform(utf8.decoder).join());
    httpClient.close();
    print(map);
    return User.fromJson(map);
  }

  void getToken(String username, String password) async {
    String url = MConstants.mainService + "/auth/login";
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(LoginRequest(username: username, password: password).toJson())));
    HttpClientResponse response = await request.close();
    Map<String, dynamic> map = json.decode(await response.transform(utf8.decoder).join());
    httpClient.close();
    MConstants.setToken(map['accessToken']);
  }
}
