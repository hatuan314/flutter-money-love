import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moneyloveapp/blocs/register/register_bloc.dart';
import 'package:moneyloveapp/ui/ultil-widgets/ultil_widget.dart';
import 'package:moneyloveapp/ui/views/register/register_painter.dart';

class SignInView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController _accountController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode _accountNode = FocusNode();
  FocusNode _passwordNode = FocusNode();

  GlobalKey<FormState> _textFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[_backgroundWidget(), _signInWidget()],
      ),
    );
  }

  _backgroundWidget() {
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

  Widget _mAppBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Opiee",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(52),
                color: Color(0xffFCFAF3),
                fontWeight: FontWeight.bold)),
        Text("Smart Consumer",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(20),
                color: Color(0xffFCFAF3),
                fontWeight: FontWeight.w400)),
      ],
    );
  }

  Widget _mHeader() {
    return Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[
        Container(
          width: double.infinity,
          height: ScreenUtil().setHeight(60),
          alignment: Alignment.center,
          child: Text(
            'Đăng nhập',
            style: TextStyle(
                color: Colors.black87,
                fontSize: ScreenUtil().setSp(28),
                fontWeight: FontWeight.w800),
          ),
        ),
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            FontAwesomeIcons.chevronLeft,
            color: Colors.black87,
            size: ScreenUtil().setSp(28),
          ),
        )
      ],
    );
  }

  Widget _signInWidget() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.transparent,
          expandedHeight: MediaQuery.of(context).size.height * 0.2,
          leading: SizedBox(),
          elevation: 0,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            background: _mAppBar(),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              color: Color(0xffFCFAF3),
            ),
            padding: EdgeInsets.symmetric(
                vertical: ScreenUtil().setHeight(40),
                horizontal: ScreenUtil().setWidth(18)),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                _mHeader(),
                BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
                  return _mBodyWidget(state);
                }),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _mBodyWidget(SignInState state) {
    return Form(
      key: _textFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          BaseWidget.baseTextFrom(
              context: context,
              controller: _accountController,
              currentNode: _accountNode,
              nextNode: _passwordNode,
              hintText: 'Email hoặc Số điện thoại',
              validator: (value) => validatorMessage(value)),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          Stack(
            alignment: Alignment.centerRight,
            children: <Widget>[
              BaseWidget.baseTextFrom(
                  context: context,
                  controller: _passwordController,
                  isShow: state.isShow,
                  currentNode: _passwordNode,
                  hintText: 'Mật khẩu',
                  validator: (value) => validatorMessage(value)),
              Padding(
                padding: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
                child: IconButton(
                  onPressed: () => _showPassOnPress(!state.isShow),
                  icon: Icon(state.isShow
                      ? FontAwesomeIcons.eyeSlash
                      : FontAwesomeIcons.eye),
                  color: Colors.black87,
                  iconSize: ScreenUtil().setHeight(28),
                ),
              )
            ],
          ),
          SizedBox(
            height: ScreenUtil().setHeight(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: () => BlocProvider.of<SignInBloc>(context)
                  ..add(SaveAccountOnPressEvent(!state.isSave)),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setHeight(12),
                      horizontal: ScreenUtil().setWidth(20)),
                  decoration: BoxDecoration(
                      color: state.isSave ? Colors.black87 : Color(0xffFCFAF3),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Row(
                    children: <Widget>[
                      state.isSave
                          ? Icon(
                              FontAwesomeIcons.checkCircle,
                              color: Color(0xffFCFAF3),
                              size: ScreenUtil().setSp(16),
                            )
                          : Icon(
                              FontAwesomeIcons.circle,
                              color: Colors.black87,
                              size: ScreenUtil().setSp(16),
                            ),
                      SizedBox(
                        width: ScreenUtil().setWidth(15),
                      ),
                      Text('Ghi nhớ',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(16),
                            color: state.isSave
                                ? Color(0xffFCFAF3)
                                : Colors.black87,
                          ))
                    ],
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () => debugPrint('Forgot Password'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                color: Colors.black87,
                splashColor: Colors.white12,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setHeight(12),
                      horizontal: ScreenUtil().setWidth(5)),
                  child: Text(
                    'Quên mật khẩu ?',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(16),
                      color: Color(0xffFCFAF3),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: ScreenUtil().setHeight(50),
          ),
          _signInButton(),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Divider(
                height: 0,
                thickness: ScreenUtil().setWidth(1.2),
                color: Colors.black26,
              ),
              Container(
                color: Color(0xffFCFAF3),
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(8)),
                child: Text(
                  "Hoặc",
                  style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                ),
              )
            ],
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _externalLinkButton(btnIndex: 0),
              SizedBox(
                width: ScreenUtil().setWidth(12),
              ),
              _externalLinkButton(btnIndex: 1),
              Visibility(
                visible: Platform.isIOS,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: ScreenUtil().setWidth(12),
                    ),
                    _externalLinkButton(btnIndex: 2),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _signInButton() {
    return RaisedButton(
      onPressed: () => _btnSignInOnPress(),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      color: Colors.black87,
      splashColor: Colors.white12,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(15)),
        alignment: Alignment.center,
        child: Text(
          'ĐĂNG NHẬP',
          style: TextStyle(
              fontSize: ScreenUtil().setSp(20),
              color: Color(0xffFCFAF3),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  _externalLinkButton({int btnIndex}) {
    return ClipOval(
      child: Material(
        color: btnIndex == 0
            ? Colors.blue[800]
            : btnIndex == 1 ? Colors.red : Colors.black87, // button color
        child: InkWell(
          splashColor: btnIndex == 0
              ? Colors.blue[400]
              : btnIndex == 1
                  ? Colors.red[400]
                  : Colors.black45, // inkwell color
          child: SizedBox(
              width: ScreenUtil().setHeight(56),
              height: ScreenUtil().setHeight(56),
              child: Icon(
                btnIndex == 0
                    ? FontAwesomeIcons.facebookF
                    : btnIndex == 1
                        ? FontAwesomeIcons.googlePlusG
                        : FontAwesomeIcons.apple,
                color: Color(0xffFCFAF3),
              )),
          onTap: () => _btnExternalLinkOnPress(btnIndex),
        ),
      ),
    );
  }

  _btnSignInOnPress() {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (_textFormKey.currentState.validate()) {
      String account = _accountController.text.trim();
      String password = _passwordController.text.trim();
      BlocProvider.of<SignInBloc>(context)
          .add(SignInButtonOnPressEvent(account, password));
    }
  }

  _btnExternalLinkOnPress(int btnIndex) {
    switch (btnIndex) {
      case 0:
        BlocProvider.of<SignInBloc>(context).add(FacebookButtonOnPressEvent());
        break;
      case 1:
        BlocProvider.of<SignInBloc>(context).add(GoogleButtonOnPressEvent());
        break;
    }
  }

  _showPassOnPress(bool isShow) {
    BlocProvider.of<SignInBloc>(context).add(ShowPasswordOnPressEvent(isShow));
  }

  validatorMessage(String value) {
    if (value.isEmpty) return "Trường này không được bỏ trống";
    return null;
  }
}
