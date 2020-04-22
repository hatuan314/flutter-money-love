import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moneyloveapp/blocs/register/register_bloc.dart';
import 'package:moneyloveapp/ui/views/register/register_painter.dart';
import 'package:moneyloveapp/utils/utils.dart';

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
        children: <Widget>[_backgroundWidget(), _bodyWidget()],
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
                RegisterPainter(30, 0, radius: 60, color: Colors.pink),
          ),
          CustomPaint(
            size: Size(double.infinity, double.infinity),
            foregroundPainter: RegisterPainter(
                MediaQuery.of(context).size.width, 100,
                radius: 200, color: Colors.cyan),
          ),
        ],
      ),
    );
  }

  _bodyWidget() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 25,
            child: _mHeader(),
          ),
          Expanded(
            flex: 75,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                color: Color(0xffFCFAF3),
              ),
              padding: EdgeInsets.symmetric(
                  vertical: ScreenUtil().setHeight(40),
                  horizontal: ScreenUtil().setWidth(18)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[_mAppBar(), _mFormWidget()],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _mHeader() {
    return Column(
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
    );
  }

  Widget _mAppBar() {
    return Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            'Đăng nhập',
            style: TextStyle(
                color: Colors.black87,
                fontSize: ScreenUtil().setSp(28),
                fontWeight: FontWeight.w700),
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

  Widget _mFormWidget() {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Form(
          key: _textFormKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _accountController,
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(23), color: Colors.black87),
                focusNode: _accountNode,
                onFieldSubmitted: (term) {
                  _accountNode.unfocus();
                  FocusScope.of(context).requestFocus(_passwordNode);
                },
                textInputAction: TextInputAction.next,
                cursorColor: Colors.black87,
                decoration: InputDecoration(
                  hintText: 'Email hoặc Số điện thoại',
                  hintStyle: TextStyle(
                    color: Colors.black38,
                    fontSize: ScreenUtil().setSp(23),
                  ),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: ScreenUtil().setHeight(20),
                      horizontal: ScreenUtil().setWidth(30)),
                  errorStyle: TextStyle(
                    color: Colors.red,
                    fontSize: ScreenUtil().setSp(14),
                  ),
                  errorBorder: _formBoder(color: Colors.red),
                  focusedErrorBorder: _formBoder(color: Colors.red),
                  enabledBorder: _formBoder(color: Colors.black87),
                  focusedBorder: _formBoder(color: Colors.black87),
                ),
                validator: (value) {
                  if (Validation.validationEmail(value) == false &&
                      Validation.validationPhone(value) == false) if (value.isEmpty)
                    return "Trường này không được bỏ trống";
                  return null;
                },
              ),
              SizedBox(
                height: ScreenUtil().setHeight(30),
              ),
              TextFormField(
                controller: _passwordController,
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(23), color: Colors.black87),
                focusNode: _passwordNode,
                onFieldSubmitted: (term) {
                  _passwordNode.unfocus();
                },
                textInputAction: TextInputAction.done,
                cursorColor: Colors.black87,
                decoration: InputDecoration(
                  hintText: 'Mật khẩu',
                  hintStyle: TextStyle(
                    color: Colors.black38,
                    fontSize: ScreenUtil().setSp(23),
                  ),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: ScreenUtil().setHeight(20),
                      horizontal: ScreenUtil().setWidth(30)),
                  errorStyle: TextStyle(
                    color: Colors.red,
                    fontSize: ScreenUtil().setSp(14),
                  ),
                  errorMaxLines: 2,
                  errorBorder: _formBoder(color: Colors.red),
                  focusedErrorBorder: _formBoder(color: Colors.red),
                  enabledBorder: _formBoder(color: Colors.black87),
                  focusedBorder: _formBoder(color: Colors.black87),
                ),
                validator: (value) {
                  if (value.isEmpty) return "Trường này không được bỏ trống";
                  return null;
                },
              ),
              SizedBox(
                height: ScreenUtil().setHeight(8),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () => BlocProvider.of<SignInBloc>(context)..add(SaveAccountOnPressEvent(!state.isSave)),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(12),
                          horizontal: ScreenUtil().setWidth(20)),
                      decoration: BoxDecoration(
                        color: state.isSave ? Colors.black87 : Color(0xffFCFAF3),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      child: Row(
                        children: <Widget>[
                          state.isSave ? Icon(
                            FontAwesomeIcons.checkCircle,
                            color: Color(0xffFCFAF3),
                            size: ScreenUtil().setSp(16),
                          ) : Icon(
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
                                color: state.isSave ? Color(0xffFCFAF3) : Colors.black87,
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
                height: ScreenUtil().setHeight(30),
              ),
              _signInButton(),
              SizedBox(
                height: ScreenUtil().setHeight(10),
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
                height: ScreenUtil().setHeight(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _externalLinkButton(btnIndex: 0),
                  SizedBox(
                    width: ScreenUtil().setWidth(12),
                  ),
                  _externalLinkButton(btnIndex: 1),
                  SizedBox(
                    width: ScreenUtil().setWidth(12),
                  ),
                  _externalLinkButton(btnIndex: 2),
                ],
              )
            ],
          ),
        );
      }
    );
  }

  InputBorder _formBoder({Color color = Colors.black87}) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: color, width: ScreenUtil().setWidth(1.2)),
        borderRadius: BorderRadius.all(Radius.circular(30)));
  }

  Widget _signInButton() {
    return RaisedButton(
      onPressed: () => debugPrint('Sign in'),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      color: Colors.black87,
      splashColor: Colors.white12,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(20)),
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
                        ? FontAwesomeIcons.google
                        : FontAwesomeIcons.apple,
                color: Color(0xffFCFAF3),
              )),
          onTap: () {},
        ),
      ),
    );
  }
}
