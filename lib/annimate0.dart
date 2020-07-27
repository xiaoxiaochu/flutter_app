import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

void main() => runApp(LogoApp());

class LogoApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LogoAppState();
  }


}


class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController controller;

  @override
  Widget build(BuildContext context) => AnimatedLogo(animation: animation);
//  {
//    // TODO: implement build
//    //throw UnimplementedError();
//    return Center(
//      child: Container(
//        margin: EdgeInsets.symmetric(vertical: 10),
//        height: animation.value,
//        width: animation.value,
//        child: FlutterLogo(),
//      ),
//    );
//
//  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(duration : const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0,end: 300).animate(controller)
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed){
          controller.reverse();
        }else if(state == AnimationStatus.dismissed){
          controller.forward();
        }
      })
      .. addStatusListener((status) => print('$status'));
//    ..addListener(() {
//      setState(() {
//
//      });
//    });
    controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

}

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