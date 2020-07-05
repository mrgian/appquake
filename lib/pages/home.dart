import 'package:appquake/pages/dettagli.dart';
import 'package:appquake/service/webclient.dart';
import 'package:appquake/widgets/terremoto_card.dart';
import 'package:appquake/widgets/gradient.dart';
import 'package:flutter/material.dart';

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
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Terremoti recenti'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: Text('Statistiche'),
              onTap: () => {
                Navigator.pop(context),
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          FutureBuilder(
            future: WebClient.getTerremoti(),
            builder: (context, snap) {
              if (snap.hasData)
                return ListView.builder(
                  itemCount: snap.data.length + 1,
                  itemBuilder: (context, i) {
                    if (i == 0)
                      return Container(width: double.infinity, height: 10);
                    else
                      return TerremotoCard(data: snap.data[i - 1]);
                  },
                );
              else
                return Center(child: CircularProgressIndicator());
            },
          ),
          AppBarGradient(size: 50),
        ],
      ),
    );
  }
}
