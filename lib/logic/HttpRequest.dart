import 'package:http/http.dart' as http;
import 'dart:convert';

final String url = 'http://dojot.fabiotest.online:8000';

Future<String> getDojotAuth() async {
  var uri = Uri.parse(url + '/auth');
  var response = await http.post(
    uri,
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({'username': 'admin', 'passwd': 'admin'}),
  );
  Map<String, dynamic> body = jsonDecode(response.body);
  return body['jwt'];
}

//Testar
Future<Map<String, dynamic>> getDeviceData(
    String deviceId, int lastN, String jwt) async {
  var uri = Uri.parse(url +
      '/history/device/' +
      deviceId +
      '/history?lastN=' +
      lastN.toString());
  var response = await http.get(
    uri,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + jwt,
    },
  );
  return jsonDecode(response.body);
}

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
