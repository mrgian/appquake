import 'package:appquake/pages/statistiche/statistiche.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final bool home;

  const MyDrawer({Key key, this.home}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.adjust),
              title: Text('Terremoti recenti'),
              onTap: () {
                if (home)
                  Navigator.pop(context);
                else {
                  Navigator.pop(context);
                  Navigator.pop(context);
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.details),
              title: Text('Statistiche'),
              onTap: () {
                if (home) {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Statistiche()));
                } else
                  Navigator.pop(context);
              },
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Sviluppata da Gianmatteo Palmieri',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
