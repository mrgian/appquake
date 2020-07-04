import 'package:appquake/model/terremoto.dart';
import 'package:flutter/material.dart';

class TerremotoCard extends StatelessWidget {
  final Terremoto data;

  const TerremotoCard({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Text(data.localita),
            Text(data.localita),
            Text(data.localita),
            Text(data.localita),
            Text(data.localita),
          ],
        ),
      ),
    );
  }
}
