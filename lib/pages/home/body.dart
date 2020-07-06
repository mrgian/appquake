import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:appquake/model/terremoto.dart';
import 'package:appquake/service/webclient.dart';
import 'package:appquake/widgets/gradient.dart';
import 'package:appquake/widgets/terremoto_card.dart';

class HomeBody extends StatefulWidget {
  HomeBody({Key key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  RefreshController controller = RefreshController(initialRefresh: true);
  List<Terremoto> terremoti = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SmartRefresher(
          controller: controller,
          header: MaterialClassicHeader(
            backgroundColor: Colors.black,
          ),
          onLoading: () async {
            terremoti = await WebClient.getTerremoti();
            setState(() {});
            controller.loadComplete();
          },
          onRefresh: () async {
            terremoti = await WebClient.getTerremoti();
            setState(() {});
            controller.refreshCompleted();
          },
          child: ListView.builder(
            itemCount: terremoti.length + 1,
            itemBuilder: (context, i) {
              if (i == 0)
                return Container(width: double.infinity, height: 10);
              else
                return TerremotoCard(data: terremoti[i - 1]);
            },
          ),
        ),
        AppBarGradient(size: 50),
      ],
    );
  }
}
