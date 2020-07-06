import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:appquake/widgets/drawer.dart';
import 'package:appquake/pages/statistiche/body.dart';

class Statistiche extends StatelessWidget {
  const Statistiche({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            "Statistiche",
            style: TextStyle(fontFamily: 'googlesans', fontSize: 30),
          ),
        ),
        elevation: 0.0,
        automaticallyImplyLeading: false,
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
      endDrawer: MyDrawer(home: false),
      body: StatisticheBody(),
    );
  }
}
