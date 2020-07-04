import 'package:appquake/service/webclient.dart';
import 'package:appquake/widgets/TerremotoCard.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(left: 10, top: 20),
          child: Text("AppQuake",
              style: TextStyle(fontFamily: 'googlesans', fontSize: 30)),
        ),
        elevation: 0.0,
      ),
      body: FutureBuilder(
        future: WebClient.getTerremoti(),
        builder: (context, snap) {
          if (snap.hasData)
            return ListView.builder(
              itemCount: snap.data.length,
              itemBuilder: (context, i) {
                return TerremotoCard(data: snap.data[i]);
              },
            );
          else
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
