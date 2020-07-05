import 'package:html/parser.dart';

class Terremoto {
  final double valoreMagnitudo;
  final String tipoMagnitudo;
  final String ora;
  final String data;
  final String localita;
  final double profondita;
  final String link;

  Terremoto(
      {this.valoreMagnitudo,
      this.tipoMagnitudo,
      this.ora,
      this.data,
      this.localita,
      this.profondita,
      this.link});

  factory Terremoto.fromJson(Map<String, dynamic> json) {
    return Terremoto(
        valoreMagnitudo: json['valoreMagnitudo'] as double,
        tipoMagnitudo: json['tipoMagnitudo'] as String,
        ora: json['ora'] as String,
        data: json['data'] as String,
        localita: json['localita'] as String,
        profondita: json['profondita'] as double,
        link: json['link'] as String);
  }
}
