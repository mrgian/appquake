import 'package:appquake/model/terremoto.dart';
import 'package:appquake/pages/dettagli.dart';
import 'package:appquake/service/webclient.dart';
import 'package:appquake/widgets/terremoto_card.dart';
import 'package:appquake/widgets/gradient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
      ),
      body: HomeBody(),
    );
  }
}

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
