import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moneyloveapp/blocs/blocs.dart';
import 'package:moneyloveapp/utils/utils.dart';

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
      body: BlocBuilder<NewExchangeBloc, NewExchangeState>(
          builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[_mAppbar(), Expanded(child: _mBody(state))],
            ),
          ),
        );
      }),
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

  Widget _mBody(NewExchangeState state) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: _switchExchangeWidget(state),
        ),
        SliverToBoxAdapter(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            elevation: 8,
            margin: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(20),
                vertical: ScreenUtil().setHeight(20)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(10),
                  vertical: ScreenUtil().setHeight(20)),
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
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Icon(
                            consumptionUIGroupMap[state.consumptionId].icon ==
                                    null
                                ? FontAwesomeIcons.questionCircle
                                : consumptionUIGroupMap[state.consumptionId]
                                    .icon,
                            color: Colors.black87,
                            size: ScreenUtil().setSp(24),
                          )),
                      Expanded(
                          flex: 4,
                          child: InkWell(
                            onTap: () =>
                                _showConsumptionGroup(state.switchIndex),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.black26))),
                              padding: EdgeInsets.symmetric(
                                  vertical: ScreenUtil().setHeight(10)),
                              child: Text(
                                consumptionUIGroupMap[state.consumptionId]
                                            .title ==
                                        null
                                    ? 'Chọn nhóm tiêu dùng'
                                    : consumptionUIGroupMap[state.consumptionId]
                                        .title,
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(24),
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Container _switchExchangeWidget(NewExchangeState state) {
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
            child: InkWell(
              onTap: () => _switchExchangeOnPress(1),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: state.switchIndex == 1 ? Colors.indigo : Colors.white,
                ),
                alignment: Alignment.center,
                child: Text(
                  'Chi ra',
                  style: TextStyle(
                      color: state.switchIndex == 1
                          ? Colors.white
                          : Colors.black87,
                      fontSize: ScreenUtil().setSp(18),
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () => _switchExchangeOnPress(2),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: state.switchIndex == 2 ? Colors.indigo : Colors.white,
                ),
                alignment: Alignment.center,
                child: Text(
                  'Thu vào',
                  style: TextStyle(
                      color: state.switchIndex == 2
                          ? Colors.white
                          : Colors.black87,
                      fontSize: ScreenUtil().setSp(18),
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () => _switchExchangeOnPress(3),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: state.switchIndex == 3 ? Colors.indigo : Colors.white,
                ),
                alignment: Alignment.center,
                child: Text(
                  'Đi vay & Cho vay',
                  style: TextStyle(
                      color: state.switchIndex == 3
                          ? Colors.white
                          : Colors.black87,
                      fontSize: ScreenUtil().setSp(18),
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _switchExchangeOnPress(int switchIndex) {
    BlocProvider.of<NewExchangeBloc>(context)
        .add(SwitchExchangeOnPressEvent(switchIndex));
  }

  _showConsumptionGroup(int switchIndex) {
    switch (switchIndex) {
      case 1:
        showDialog(
            context: context,
            builder: (BuildContext context) => Dialog(
                  backgroundColor: Colors.transparent,
                  child: _expanseSelectWidget(),
                ));
        break;
      case 2:
        showDialog(
            context: context,
            builder: (BuildContext context) => Dialog(
              backgroundColor: Colors.transparent,
              child: _incomeSelectWidget(),
            ));
        break;
      case 3:
        showDialog(
            context: context,
            builder: (BuildContext context) => Dialog(
                  backgroundColor: Colors.transparent,
                  child: _debtSelectWidget(),
                ));
        break;
    }
  }

  Widget _debtSelectWidget() {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      elevation: 8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          Text(
            'Đi vay & Cho vay',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(28),
                color: Colors.black87,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
            child: GridView.count(
              shrinkWrap: true,
              primary: false,
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              children: <Widget>[
                _debtElementWidget('Đi vay', 30),
                _debtElementWidget('Thu nợ', 31),
                _debtElementWidget('Cho vay', 32),
                _debtElementWidget('Trả nợ', 33)
              ],
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          )
        ],
      ),
    );
  }

  Widget _debtElementWidget(String title, int consumptionId) {
    return InkWell(
      onTap: () {
        BlocProvider.of<NewExchangeBloc>(context)
            .add(SelectConsumptionMemberEvent(consumptionId));
        Navigator.of(context).pop();
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: Colors.black26, width: 1.5)),
        alignment: Alignment.center,
        child: Text(
          '$title',
          style: TextStyle(
              fontSize: ScreenUtil().setSp(24),
              color: Colors.black87,
              fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  _expanseSelectWidget() {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      elevation: 8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          Text(
            'Chi ra',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(28),
                color: Colors.black87,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
            child: GridView.count(
              shrinkWrap: true,
              primary: false,
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              children: <Widget>[
                _expenseElementWidget(10),
                _expenseElementWidget(11),
                _expenseElementWidget(12),
                _expenseElementWidget(13),
                _expenseElementWidget(14),
                _expenseElementWidget(15),
                _expenseElementWidget(16),
                _expenseElementWidget(17),
                _expenseElementWidget(18),
                _expenseElementWidget(19),
                _expenseElementWidget(110),
                _expenseElementWidget(111),
                _expenseElementWidget(112),
              ],
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          )
        ],
      ),
    );
  }

  Widget _expenseElementWidget(int consumptionId) {
    ConsumptionUI consumptionUI = consumptionUIGroupMap[consumptionId];
    return InkWell(
      onTap: () {
        BlocProvider.of<NewExchangeBloc>(context)
            .add(SelectConsumptionMemberEvent(consumptionId));
        Navigator.of(context).pop();
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: Colors.black26, width: 1.5)),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              consumptionUI.icon,
              color: Colors.black87,
              size: ScreenUtil().setHeight(24),
            ),
            SizedBox(
              height: 8,
            ),
            AutoSizeText(
              '${consumptionUI.title}',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(18),
                  color: Colors.black87,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  _incomeSelectWidget() {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      elevation: 8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          Text(
            'Chi ra',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(28),
                color: Colors.black87,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          Padding(
            padding:
            EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
            child: GridView.count(
              shrinkWrap: true,
              primary: false,
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              children: <Widget>[
                _expenseElementWidget(20),
                _expenseElementWidget(21),
                _expenseElementWidget(22),
                _expenseElementWidget(23),
                _expenseElementWidget(24),
                _expenseElementWidget(25),
              ],
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          )
        ],
      ),
    );
  }
}
