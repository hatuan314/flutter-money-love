import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moneyloveapp/ui/ultil-widgets/ultil_widget.dart';

class NewExchangePageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewExchangePageView();
}

class _NewExchangePageView extends State<NewExchangePageView> {
  TextEditingController _noteController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: <Widget>[_mAppbar(), Expanded(child: _mBody())],
        ),
      ),
    );
  }

  Widget _mAppbar() {
    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 56,
          alignment: Alignment.center,
          child: Text(
            'Thêm giao dịch',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(28),
                color: Colors.black87,
                fontWeight: FontWeight.w800),
          ),
        ),
        IconButton(
          icon: Icon(
            FontAwesomeIcons.save,
            color: Colors.black87,
            size: ScreenUtil().setSp(28),
          ),
        )
      ],
    );
  }

  Widget _mBody() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: _switchExchangeWidget(),
        ),
        SliverToBoxAdapter(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            elevation: 8,
            margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(20),
              vertical: ScreenUtil().setHeight(20)
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(10),
                  vertical: ScreenUtil().setHeight(20)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Icon(
                            FontAwesomeIcons.coins,
                            color: Colors.black87,
                            size: ScreenUtil().setSp(24),
                          )),
                      Expanded(
                          flex: 4,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.black26))),
                            padding: EdgeInsets.symmetric(
                                vertical: ScreenUtil().setHeight(10)),
                            child: Text(
                              '0 đ',
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(32),
                                  color: Colors.green,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.end,
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(20),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Icon(
                            FontAwesomeIcons.stickyNote,
                            color: Colors.black87,
                            size: ScreenUtil().setSp(24),
                          )),
                      Expanded(
                          flex: 4,
                          child: Form(
                            key: _formKey,
                            child: TextFormField(
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: ScreenUtil().setSp(24),
                                  fontWeight: FontWeight.w500),
                              decoration: InputDecoration(
                                  hintText: "Thêm ghi chú",
                                  hintStyle: TextStyle(
                                      color: Colors.black38,
                                      fontSize: ScreenUtil().setSp(24),
                                      fontWeight: FontWeight.w500),
                                  fillColor: Colors.black38,
                                  focusColor: Colors.black38,
                                  hoverColor: Colors.black38),
                              cursorColor: Colors.black87,
                            ),
                          )),
                    ],
                  ),

                  SizedBox(
                    height: ScreenUtil().setHeight(20),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Icon(
                            FontAwesomeIcons.calendar,
                            color: Colors.black87,
                            size: ScreenUtil().setSp(24),
                          )),
                      Expanded(
                          flex: 4,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.black26))),
                            padding: EdgeInsets.symmetric(
                                vertical: ScreenUtil().setHeight(10)),
                            child: Text(
                              'Hôm nay',
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(24),
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(20),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Icon(
                            FontAwesomeIcons.wallet,
                            color: Colors.black87,
                            size: ScreenUtil().setSp(24),
                          )),
                      Expanded(
                          flex: 4,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.black26))),
                            padding: EdgeInsets.symmetric(
                                vertical: ScreenUtil().setHeight(10)),
                            child: Text(
                              'Chọn ví',
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(24),
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(20),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(10)),
                    child: Text(
                      'Chọn nhóm tiêu dùng',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(24),
                          color: Colors.black38,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  BaseWidget.selectConsumerGroup(1)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Container _switchExchangeWidget() {
    return Container(
      height: ScreenUtil().setHeight(56),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white),
      margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.indigo,
              ),
              alignment: Alignment.center,
              child: Text(
                'Chi ra',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(18),
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
              alignment: Alignment.center,
              child: Text(
                'Thu vào',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: ScreenUtil().setSp(18),
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
              alignment: Alignment.center,
              child: Text(
                'Đi vay & Cho vay',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: ScreenUtil().setSp(18),
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }




}
