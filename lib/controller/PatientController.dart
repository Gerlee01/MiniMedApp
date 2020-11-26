import 'dart:convert';
import 'dart:io';

import 'package:mini_med_front/entity/Patient.dart';
import 'package:mini_med_front/util/MConstants.dart';

class PatientController{
  Future<Patient> findPatient() async {
    String url = MConstants.mainService + "/patient/getPatient";
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
    return Patient.fromJson(map);
  }
}