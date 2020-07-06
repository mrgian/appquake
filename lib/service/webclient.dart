import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html;

import 'package:appquake/model/terremoto.dart';

class WebClient {
  static Future<List<Terremoto>> parseTerremoti(String responseBody) async {
    var parsed = convert.jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Terremoto>((json) => Terremoto.fromJson(json)).toList();
  }

  static Future<List<Terremoto>> getTerremoti() async {
    var response;

    try {
      response = await http.get('https://mrgian.it/terremoti');
    } catch (e) {
      return null;
    }

    return parseTerremoti(response.body);
  }

  static Future<Map<String, dynamic>> getStatistiche(String field) async {
    var response;

    if (field == null) {
      try {
        response = await http.get('https://mrgian.it/terremoti/stats');
      } catch (e) {
        return null;
      }
    }

    print(response.body);

    var map = convert.jsonDecode(response.body);

    return map;
  }

  static Future<String> getMapLink(Terremoto terremoto) async {
    var response = await http.get(terremoto.link);
    var body = response.body;
    var link =
        html.parse(body).getElementsByTagName('iframe').first.attributes['src'];
    return link;
  }
}
