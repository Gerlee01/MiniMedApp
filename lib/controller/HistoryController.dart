import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:mini_med_front/entity/History.dart';
import 'package:mini_med_front/models/chartHistoryModel.dart';
import 'package:mini_med_front/util/MConstants.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class HistoryController {
  Future<List<History>> findAll(Type type) async {
    String url = MConstants.mainService + "/history/all/" + type.toString().substring(5, type.toString().length);
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    request.headers.set('Authorization', 'Bearer ' + MConstants.token);
    HttpClientResponse response = await request.close();
    if (response.statusCode != 200) return null;
    List<dynamic> body =
        jsonDecode(await response.transform(utf8.decoder).join());
    return body.map((dynamic item) => History.fromJson(item)).toList();
  }

  Future<ChartHistoryModel> findChartValues(Type type) async {
    String url = MConstants.mainService + "/history/chart/" + type.toString().substring(5, type.toString().length);
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    request.headers.set('Authorization', 'Bearer ' + MConstants.token);
    HttpClientResponse response = await request.close();
    if (response.statusCode != 200) return null;
    Map<String, dynamic> map = json.decode(await response.transform(utf8.decoder).join());
    httpClient.close();
    return ChartHistoryModel.fromJson(map);
  }

  Future<String> findPdfById(int id) async {
    String url = MConstants.mainService + "/history/pdf/id/" + id.toString();
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer ' + MConstants.token
    });
    print("response: " + response.statusCode.toString());
    if (response.statusCode != 200) return null;
    var dir = await getTemporaryDirectory();
    File tempFile = new File(dir.path + "/" + id.toString() + ".pdf");
    await tempFile.writeAsBytes(response.bodyBytes, flush: true);
    print("temp path: " + tempFile.path);
    return tempFile.path;
  }
}
