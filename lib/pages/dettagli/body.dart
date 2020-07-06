import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:appquake/model/terremoto.dart';
import 'package:appquake/service/webclient.dart';
import 'package:appquake/utils/color.dart';
import 'package:appquake/widgets/gradient.dart';

class DettagliBody extends StatelessWidget {
  final Terremoto data;

  const DettagliBody({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        FutureBuilder(
          future: WebClient.getMapLink(data),
          builder: (context, snap) {
            if (snap.hasData)
              return WebView(
                initialUrl: snap.data,
                javascriptMode: JavascriptMode.unrestricted,
              );
            else
              return Center(child: CircularProgressIndicator());
          },
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
                        padding: EdgeInsets.only(left: 30, top: 20, bottom: 15),
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
                      style: TextStyle(fontFamily: 'googlesans', fontSize: 20),
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
    );
  }
}
