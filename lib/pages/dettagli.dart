import 'package:appquake/model/terremoto.dart';
import 'package:appquake/utils/color.dart';
import 'package:appquake/widgets/gradient.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
          Column(
            children: <Widget>[
              Expanded(
                child: FutureBuilder(
                  future: null,
                  builder: (context, snap) {
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              Container(
                width: double.infinity,
                height: 270,
                color: Colors.red,
              )
            ],
          ),
          WebView(
            initialUrl:
                'https://www.openstreetmap.org/export/embed.html?bbox=14.68385784389%2C40.570271357633%2C15.63614215611%2C41.289728642367&amp;layer=mapnik&amp;marker=40.93%2C15.16',
            javascriptMode: JavascriptMode.unrestricted,
          ),
          AppBarGradient(size: 50),
          Positioned(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white.withOpacity(0.8),
                ),
                width: double.infinity,
                height: 235,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding:
                              EdgeInsets.only(left: 30, top: 20, bottom: 15),
                          child: Text(
                            data.valoreMagnitudo.toString(),
                            style: TextStyle(
                                fontFamily: 'googlesans',
                                fontSize: 50,
                                color: ColorUtils.getColorFromValue(
                                    data.valoreMagnitudo)),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => launch(data.link),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 30, top: 20, bottom: 15),
                            child: Icon(
                              Icons.info,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30, bottom: 20),
                      child: Text(
                        data.localita,
                        style:
                            TextStyle(fontFamily: 'googlesans', fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30, bottom: 20),
                      child: Text(
                        data.ora + " - " + data.data,
                        style: TextStyle(
                            fontFamily: 'googlesanslight', fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30, bottom: 20),
                      child: Text(
                        data.profondita.toString() + " km di profondità",
                        style: TextStyle(
                            fontFamily: 'googlesanslight', fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
