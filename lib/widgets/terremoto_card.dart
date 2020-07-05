import 'package:appquake/model/terremoto.dart';
import 'package:flutter/material.dart';

class TerremotoCard extends StatelessWidget {
  final Terremoto data;

  const TerremotoCard({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            TextMagnitudo(magnitudo: data.valoreMagnitudo),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      data.localita,
                      style: TextStyle(
                        fontFamily: 'googlesans',
                        fontSize: 17,
                      ),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      data.ora + " - " + data.data,
                      style: TextStyle(
                        fontFamily: 'googlesanslight',
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(Icons.navigate_next),
            ),
          ],
        ),
      ),
    );
  }
}

class TextMagnitudo extends StatelessWidget {
  final double magnitudo;

  const TextMagnitudo({Key key, this.magnitudo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Text(
        magnitudo.toString(),
        style: TextStyle(
            fontFamily: 'googlesans',
            fontSize: 25,
            color: getColorFromValue(magnitudo)),
      ),
    );
  }

  Color getColorFromValue(double val) {
    int g = (255 - 50 * (val - 1)).round();
    if (g > 255) g = 255;
    if (g < 0) g = 0;
    return Color.fromARGB(255, 255, g, 50);

    /*if (val < 3) return Color(0xfffbc02d);
    if (val >= 3 && val <= 4.1) return Color(0xfff57c00);

    return Color(0xffe64a19);*/
  }
}
