import 'dart:convert';
import 'dart:io';

import 'package:mini_med_front/entity/Payment.dart';
import 'package:mini_med_front/util/MConstants.dart';

class PaymentController{
  Future<List<Payment>> findAll() async {
    String url = MConstants.mainService + "/payment/all";
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    request.headers.set('Authorization', 'Bearer ' + MConstants.token);
    HttpClientResponse response = await request.close();
    if (response.statusCode != 200) return null;
    List<dynamic> body =
    jsonDecode(await response.transform(utf8.decoder).join());
    return body.map((dynamic item) => Payment.fromJson(item)).toList();
  }
}