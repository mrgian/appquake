import 'package:flutter/material.dart';

import 'package:appquake/model/terremoto.dart';
import 'package:appquake/pages/dettagli/body.dart';

class Dettagli extends StatelessWidget {
  final Terremoto data;

  const Dettagli({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            "Dettagli",
            style: TextStyle(fontFamily: 'googlesans', fontSize: 30),
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(top: 13, left: 10),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        elevation: 0.0,
      ),
      body: DettagliBody(data: data),
    );
  }
}
