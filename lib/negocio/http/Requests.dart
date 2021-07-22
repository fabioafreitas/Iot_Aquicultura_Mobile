import 'package:http/http.dart' as http;
import 'package:iotaquicultura/negocio/constants/HttpConstants.dart';
import 'dart:convert';
import 'dart:io';

import 'package:iotaquicultura/negocio/models/JwtModel.dart';

class Requests {
  static Future<JWTModel> getDojotJWT(
      {String username: 'admin', String password: 'admin'}) async {
    var uri = Uri.parse(HttpConstants.url + '/auth');
    var response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'username': username, 'passwd': password}),
    );
    if (response.statusCode != 200) {
      throw HttpException('Erro ao obter o jwt, codigo ${response.statusCode}');
    }
    dynamic json = jsonDecode(response.body);
    return JWTModel.fromJson(json);
  }

  //Testar
  // static Future<Map<String, dynamic>> getDeviceData(
  //     String deviceId, int lastN, String jwt) async {
  //   var uri = Uri.parse(HttpConstants.url +
  //       '/history/device/' +
  //       deviceId +
  //       '/history?lastN=' +
  //       lastN.toString());
  //   var response = await http.get(
  //     uri,
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Bearer ' + jwt,
  //     },
  //   );
  //   return jsonDecode(response.body);
  // }

  //
  // Future<Map<String, dynamic>> getExportData(String jwt) async {
  //   var uri = Uri.parse(url + '/export');
  //   var response = await http.get(
  //     uri,
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Bearer ' + jwt,
  //     },
  //   );
  //   return jsonDecode(response.body);
  // }

}
