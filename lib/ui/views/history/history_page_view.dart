import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class HistoryPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _mAppBar(context),
            Expanded(child: _mBody(context)),
          ],
        ),
      ),
    );
  }

  Widget _mAppBar(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 56,
      child: Center(
        child: Text(
          'Sổ chi tiêu',
          style: TextStyle(
              fontSize: ScreenUtil().setSp(28),
              color: Colors.black87,
              fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  Widget _mBody(BuildContext context) {
    return Column(
      children: <Widget>[
        _allWalletWidget(context),
      ],
    );
  }

  _allWalletWidget(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          autoPlay: false,
          onPageChanged: (index, reason) => debugPrint("$index")),
      items: <Widget>[
        _walletCardElementWidget(context, 'assets/img/save-money/card-1.png', Colors.lightBlue, 'Wallet Alpha'),
        _walletCardElementWidget(context, 'assets/img/save-money/card-2.png', Colors.pinkAccent, 'Wallet Beta'),
        _walletCardElementWidget(context, 'assets/img/save-money/card-3.png', Colors.grey[400], 'Wallet Gammar'),
        _walletCardElementWidget(context, 'assets/img/save-money/card-4.png', Color(0xffFECA77), 'Wallet Delta'),
        _walletCardElementWidget(context, 'assets/img/save-money/card-5.png', Color(0xffffe9c0), 'Wallet Epsilon'),
        _walletCardElementWidget(context, 'assets/img/save-money/card-6.png', Color(0xff20cbf9), 'Wallet Zeta'),
        _walletCardElementWidget(context, 'assets/img/save-money/card-7.png', Color(0xffbd4ade), 'Wallet Theta'),
        _walletCardElementWidget(context, 'assets/img/save-money/card-8.png', Color(0xff2d5299), 'Wallet Iota'),
        _walletCardElementWidget(context, 'assets/img/save-money/card-9.png', Colors.yellowAccent[400], 'Wallet Kappa'),
        _walletCardElementWidget(context, 'assets/img/save-money/card-10.png', Color(0xff6e60ff), 'Wallet Lambda'),
      ],
    );
  }

  _walletCardElementWidget(BuildContext context, String asset, Color backgroundColor, String walletName) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      elevation: 8,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: backgroundColor),
            padding:
                EdgeInsets.symmetric(
                    vertical: ScreenUtil().setHeight(20),
                    horizontal: ScreenUtil().setWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    '$walletName',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(28),
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end,
                    maxLines: 2,
                  ),
                ),
                Text(
                  '2.350.000 đ',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(18),
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                  maxLines: 2,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(10),
              bottom: ScreenUtil().setHeight(10)
            ),
            child: Image.asset(asset,
                height: ScreenUtil().setHeight(150), fit: BoxFit.fitHeight),
          )
        ],
      ),
    );
  }
}
