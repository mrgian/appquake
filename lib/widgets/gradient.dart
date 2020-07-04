import 'package:flutter/material.dart';

class AppBarGradient extends StatelessWidget {
  final double size;

  const AppBarGradient({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.3, 0.7],
              colors: [Colors.white, Colors.white.withOpacity(0)])),
      child: SizedBox(
        width: double.infinity,
        height: size,
      ),
    );
  }
}
