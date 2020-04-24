import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moneyloveapp/ui/views/register/register_painter.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[_backgroundWidget(context), _bodyWidget(context)],
      ),
    );
  }

  _backgroundWidget(BuildContext context) {
    return Container(
      color: Colors.indigoAccent,
      child: Stack(
        children: <Widget>[
          CustomPaint(
            size: Size(double.infinity, double.infinity),
            foregroundPainter:
                RegisterPainter(10, 50, radius: 100, color: Colors.pinkAccent),
          ),
          CustomPaint(
            size: Size(double.infinity, double.infinity),
            foregroundPainter: RegisterPainter(
                MediaQuery.of(context).size.width * 0.9, 200,
                radius: 150, color: Colors.cyan),
          ),
        ],
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Opiee",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(50),
                        color: Color(0xffFCFAF3),
                        fontWeight: FontWeight.bold)),
                Text("Smart Consumer",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(20),
                        color: Color(0xffFCFAF3),
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                color: Color(0xffFCFAF3),
              ),
              padding: EdgeInsets.symmetric(
                  vertical: ScreenUtil().setHeight(50),
                  horizontal: ScreenUtil().setWidth(30)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SvgPicture.asset(
                        'assets/img/piggy-bank-logo.svg',
                        color: Colors.pinkAccent[100],
                        height: ScreenUtil().setHeight(150),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(10),
                      ),
                      Text(
                        'Quản lý thu chi thông minh và hiệu quả',
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(23),
                            color: Colors.black54,
                            fontWeight: FontWeight.w600),
                        maxLines: 3,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () => Navigator.pushNamed(context, '/sign-in'),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            border: Border.all(color: Colors.black87, width: 3),
                            color: Colors.black,
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(15)),
                          child: Text(
                            "ĐĂNG NHẬP",
                            style: TextStyle(
                              color: Color(0xffFCFAF3),
                              fontSize: ScreenUtil().setSp(20),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(20),
                      ),
                      InkWell(
                        onTap: () => Navigator.pushNamed(context, '/sign-up'),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            border: Border.all(color: Colors.black87, width: 3),
                            color: Color(0xffFCFAF3),
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(15)),
                          child: Text(
                            "ĐĂNG KÝ",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: ScreenUtil().setSp(20),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
