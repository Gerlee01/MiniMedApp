import 'dart:convert';
import 'dart:io';

import 'package:mini_med_front/entity/History.dart';
import 'package:mini_med_front/models/chartHistoryModel.dart';
import 'package:mini_med_front/util/MConstants.dart';

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
}
