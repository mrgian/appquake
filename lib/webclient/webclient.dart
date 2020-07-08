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

  static Future<List<Map<String, dynamic>>> getStatistiche() async {
    List<Map<String, dynamic>> stats = new List();

    try {
      var response;

      response = await http.get('https://mrgian.it/terremoti/stats');
      stats.add(convert.jsonDecode(response.body));

      response = await http
          .get('https://mrgian.it/terremoti/stats?field=valoreMagnitudo');
      stats.add(convert.jsonDecode(response.body));

      response =
          await http.get('https://mrgian.it/terremoti/stats?field=profondita');
      stats.add(convert.jsonDecode(response.body));
    } catch (e) {
      return null;
    }

    return stats;
  }

  static Future<String> getMapLink(Terremoto terremoto) async {
    var response = await http.get(terremoto.link);
    var body = response.body;
    var link =
        html.parse(body).getElementsByTagName('iframe').first.attributes['src'];
    return link;
  }
}
