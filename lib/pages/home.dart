import 'package:appquake/service/webclient.dart';
import 'package:appquake/widgets/TerremotoCard.dart';
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
          padding: const EdgeInsets.only(top: 10),
          child: Text("AppQuake",
              style: TextStyle(fontFamily: 'googlesans', fontSize: 30)),
        ),
        elevation: 0.0,
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
                      return SizedBox(width: double.infinity, height: 10);
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
