import 'package:flutter/material.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:appquake/webclient/webclient.dart';
import 'package:appquake/widgets/gradient.dart';

class StatisticheBody extends StatefulWidget {
  StatisticheBody({Key key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<StatisticheBody> {
  RefreshController controller = RefreshController(initialRefresh: true);
  List<Map<String, dynamic>> stats;

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
            stats = await WebClient.getStatistiche();
            setState(() {});
            controller.loadComplete();
          },
          onRefresh: () async {
            stats = await WebClient.getStatistiche();
            setState(() {});
            controller.refreshCompleted();
          },
          child: body(),
        ),
        AppBarGradient(size: 50),
      ],
    );
  }

  Widget body() {
    if (stats == null)
      return Container(width: 0, height: 0);
    else
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 10,
            ),
            OneValueCard(
                value: stats[0]['mediaGiorno'] as double,
                desc: 'terremoti in un giorno'),
            ThreeValueCard(
              min: stats[1]['min'],
              max: stats[1]['max'],
              avg: stats[1]['avg'],
              field: "magnitudo",
            ),
            ThreeValueCard(
              min: stats[2]['min'],
              max: stats[2]['max'],
              avg: stats[2]['avg'],
              field: "profondità",
            ),
          ],
        ),
      );
  }
}

class ThreeValueCard extends StatelessWidget {
  final double min;
  final double max;
  final double avg;
  final String field;

  const ThreeValueCard({Key key, this.min, this.max, this.avg, this.field})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            StatText(value: min, desc: field + " minima"),
            StatText(value: max, desc: field + " massima"),
            StatText(value: avg, desc: field + " media"),
          ],
        ),
      ),
    );
  }
}

class StatText extends StatelessWidget {
  final double value;
  final String desc;

  const StatText({Key key, this.value, this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(30),
          child: Text(value.toStringAsFixed(1),
              style: TextStyle(fontFamily: 'googlesans', fontSize: 25)),
        ),
        Text(
          desc,
          style: TextStyle(fontFamily: 'googlesans', fontSize: 17),
        )
      ],
    );
  }
}

class OneValueCard extends StatelessWidget {
  final double value;
  final String desc;

  const OneValueCard({Key key, this.value, this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(30),
              child: Text(
                value.toStringAsFixed(1),
                style: TextStyle(
                  fontFamily: 'googlesans',
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            ),
            Text(
              desc,
              style: TextStyle(
                fontFamily: 'googlesans',
                fontSize: 17,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
