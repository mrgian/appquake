import 'package:appquake/model/terremoto.dart';
import 'package:appquake/widgets/gradient.dart';
import 'package:flutter/material.dart';

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
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10, right: 10),
            child: Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          FutureBuilder(
            future: null,
            builder: (context, snap) {
              return Center(child: CircularProgressIndicator());
            },
          ),
          AppBarGradient(size: 50),
        ],
      ),
    );
  }
}
