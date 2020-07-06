import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.adjust),
              title: Text('Terremoti recenti'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.details),
              title: Text('Statistiche'),
              onTap: () => {
                Navigator.pop(context),
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
