import 'dart:convert';
import 'dart:io';

import 'package:mini_med_front/entity/Prescription.dart';
import 'package:mini_med_front/util/MConstants.dart';

class PillController {
  Future<List<Prescription>> findAll() async {
    String url = MConstants.mainService + "/prescription/all/";
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    request.headers.set('Authorization', 'Bearer ' + MConstants.token);
    HttpClientResponse response = await request.close();
    if (response.statusCode != 200) return null;
    List<dynamic> body =
        jsonDecode(await response.transform(utf8.decoder).join());
    return body.map((dynamic item) => Prescription.fromJson(item)).toList();
  }
}
