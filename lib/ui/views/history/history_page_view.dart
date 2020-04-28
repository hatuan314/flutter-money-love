import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        SizedBox(
          height: ScreenUtil().setHeight(20),
        ),
        Expanded(child: _historyWidget(context)),
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
        _walletCardElementWidget(context, 'assets/img/save-money/card-1.png',
            Colors.lightBlue, 'Wallet Alpha'),
        _walletCardElementWidget(context, 'assets/img/save-money/card-2.png',
            Colors.pinkAccent, 'Wallet Beta'),
        _walletCardElementWidget(context, 'assets/img/save-money/card-3.png',
            Colors.grey[400], 'Wallet Gammar'),
        _walletCardElementWidget(context, 'assets/img/save-money/card-4.png',
            Color(0xffFECA77), 'Wallet Delta'),
        _walletCardElementWidget(context, 'assets/img/save-money/card-5.png',
            Color(0xffffe9c0), 'Wallet Epsilon'),
        _walletCardElementWidget(context, 'assets/img/save-money/card-6.png',
            Color(0xff20cbf9), 'Wallet Zeta'),
        _walletCardElementWidget(context, 'assets/img/save-money/card-7.png',
            Color(0xffbd4ade), 'Wallet Theta'),
        _walletCardElementWidget(context, 'assets/img/save-money/card-8.png',
            Color(0xff2d5299), 'Wallet Iota'),
        _walletCardElementWidget(context, 'assets/img/save-money/card-9.png',
            Colors.amber, 'Wallet Kappa'),
        _walletCardElementWidget(context, 'assets/img/save-money/card-10.png',
            Color(0xff6e60ff), 'Wallet Lambda'),
      ],
    );
  }

  _walletCardElementWidget(BuildContext context, String asset,
      Color backgroundColor, String walletName) {
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
            padding: EdgeInsets.symmetric(
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
                bottom: ScreenUtil().setHeight(10)),
            child: Image.asset(asset,
                height: ScreenUtil().setHeight(150), fit: BoxFit.fitHeight),
          )
        ],
      ),
    );
  }

  Widget _historyWidget(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            color: Colors.white),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: ScreenUtil().setHeight(12),
                  horizontal: ScreenUtil().setWidth(20)),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Thu chi tháng 4',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: ScreenUtil().setSp(20),
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    IconButton(
                        icon: Icon(FontAwesomeIcons.calendar,
                            color: Colors.black87,
                            size: ScreenUtil().setSp(24)))
                  ],
                ),
              ),
            ),
            Expanded(
              child: CustomScrollView(
                shrinkWrap: true,
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return _historyElementWidget();
                    }, childCount: 10),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: ScreenUtil().setHeight(10),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget _historyElementWidget() {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      elevation: 8,
      color: Colors.white,
      margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(10),
          vertical: ScreenUtil().setHeight(8)),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(15)),
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Text(
                      '24',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: ScreenUtil().setSp(36),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
                Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Thứ Sáu',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: ScreenUtil().setSp(16),
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'tháng 4 2020',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: ScreenUtil().setSp(16),
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
            child: Divider(
              color: Colors.black26,
              height: 1,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(8)),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Icon(
                        FontAwesomeIcons.graduationCap,
                        size: ScreenUtil().setSp(36),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Giáo dục',
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(20),
                                color: Colors.black87,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Mua khóa học NodeJS',
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(20),
                                color: Colors.black54,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding:
                            EdgeInsets.only(right: ScreenUtil().setWidth(15)),
                        child: Text('-22.266.000',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: ScreenUtil().setSp(20),
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.end),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
