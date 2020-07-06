import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:appquake/pages/home/body.dart';
import 'package:appquake/pages/home/drawer.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            "AppQuake",
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
      endDrawer: HomeDrawer(),
      body: HomeBody(),
    );
  }
}
