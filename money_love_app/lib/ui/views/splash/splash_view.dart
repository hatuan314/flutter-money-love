import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:moneyloveapp/ui/views/splash/splash.dart';

class SplashView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  double _width;
  double _height;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData().then((value) async {
      Navigator.pushReplacementNamed(context, '/register');
    });
  }

  Future initData() async {
    await Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffFCFAF3),
      body: SafeArea(
        child: Stack(
          children: <Widget>[_backgroundWidget(), _logoWidget()],
        ),
      ),
    );
  }

  _logoWidget() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'assets/img/piggy-bank-logo.svg',
              color: Colors.pinkAccent[100],
              height: MediaQuery.of(context).size.height / 5,
            ),
            GradientText(
              "Oipee",
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.cyanAccent[400],
                  Colors.indigoAccent,
                  Colors.pink
                ],
              ),
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(45),
                  fontWeight: FontWeight.w800),
            )
          ],
        ),
      ),
    );
  }

  _backgroundWidget() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: <Widget>[
          CustomPaint(
            size: Size(double.infinity, double.infinity),
            foregroundPainter:
                SplashPainter(_width, _height, radius: 30, color: Colors.cyan),
          ),
          CustomPaint(
            size: Size(double.infinity, double.infinity),
            foregroundPainter: SplashPainter(_width, _height,
                radius: 60, color: Colors.indigoAccent),
          ),
          CustomPaint(
            size: Size(double.infinity, double.infinity),
            foregroundPainter:
                SplashPainter(_width, _height, radius: 100, color: Colors.pink),
          ),
        ],
      ),
    );
  }
}
