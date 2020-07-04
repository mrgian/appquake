import 'dart:convert' as convert;
import 'package:appquake/model/terremoto.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class WebClient {
  static List<Terremoto> parseTerremoti(String responseBody) {
    final parsed =
        convert.jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Terremoto>((json) => Terremoto.fromJson(json)).toList();
  }

  static Future<List<Terremoto>> getTerremoti() async {
    final response = await http.get('https://mrgian.it/terremoti');
    return compute(parseTerremoti, response.body);
  }
}
