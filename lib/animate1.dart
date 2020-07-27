
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';


class AnimatedLogo  extends AnimatedWidget {

  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final animation = listenable as Animation<double>;

    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
  
}