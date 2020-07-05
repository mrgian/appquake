import 'dart:convert' as convert;
import 'package:appquake/model/terremoto.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html;

class WebClient {
  static List<Terremoto> parseTerremoti(String responseBody) {
    var parsed = convert.jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Terremoto>((json) => Terremoto.fromJson(json)).toList();
  }

  static Future<List<Terremoto>> getTerremoti() async {
    var response = await http.get('https://mrgian.it/terremoti');
    return compute(parseTerremoti, response.body);
  }

  static Future<String> getMapLink(Terremoto terremoto) async {
    var response = await http.get(terremoto.link);
    var body = response.body;
    var link =
        html.parse(body).getElementsByTagName('iframe').first.attributes['src'];
    return link;
  }
}
