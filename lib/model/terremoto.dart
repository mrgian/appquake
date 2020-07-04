class Terremoto {
  double valoreMagnitudo;
  String tipoMagnitudo;
  String ora;
  String data;
  String localita;
  String profondita;
  String link;

  Terremoto(Map<String, dynamic> data) {
    valoreMagnitudo = data['valoreMagnitudo'];
    tipoMagnitudo = data['tipoMagnitudo'];
    ora = data['ora'];
    data = data['data'];
    localita = data['localita'];
    link = data['link'];
  }
}
