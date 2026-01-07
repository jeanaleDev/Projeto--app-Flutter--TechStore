import 'dart:convert';

import 'package:http/http.dart' as http;

class Back4appService {
  static const _baseUrl = "https://parseapi.back4app.com/classes/Produt";

  static const _headers = {
    "X-Parse-Application-Id": "WRrW6NDWpBOSsRdFjdlx9nabu21RLLvlvcIMiB1I",
    "X-Parse-REST-API-Key": "pLo9dJyS3T9gBidJqwuvTZAeJvoSTPtX7vJ304HL",
    "content-type": "application/json",
  };
  Future<List<dynamic>> fecticioProduct() async {
    final reponse = await http.get(Uri.parse(_baseUrl), headers: _headers);
    if (reponse.statusCode == 200) {
      final body = jsonDecode(reponse.body);
      return body['results'];
    } else {
      throw Exception('Erro ao buscar produtos');
    }
  }
}
