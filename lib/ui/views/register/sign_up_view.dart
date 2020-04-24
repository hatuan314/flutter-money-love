import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moneyloveapp/blocs/register/register_bloc.dart';
import 'package:moneyloveapp/models/models.dart';
import 'package:moneyloveapp/ui/my_ui.dart';
import 'package:moneyloveapp/ui/views/register/register_painter.dart';
import 'package:moneyloveapp/utils/utils.dart';

class SignUpView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView>
    with SingleTickerProviderStateMixin {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  FocusNode _usernameNode = FocusNode();
  FocusNode _accountNode = FocusNode();
  FocusNode _passwordNode = FocusNode();
  FocusNode _phoneNode = FocusNode();

  GlobalKey<FormState> _textFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[_backgroundWidget(), _signUpWidget()],
      ),
    );
  }

  Widget _backgroundWidget() {
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
                MediaQuery
                    .of(context)
                    .size
                    .width * 0.9, 200,
                radius: 150, color: Colors.cyan),
          ),
        ],
      ),
    );
  }

  Widget _signUpWidget() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.transparent,
          expandedHeight: MediaQuery
              .of(context)
              .size
              .height * 0.2,
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
            height: MediaQuery
                .of(context)
                .size
                .height * 0.8,
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
                BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
                  return _mBodyWidget(state);
                }),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _mAppBar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Opiee",
          style: TextStyle(
              fontSize: ScreenUtil().setSp(52),
              color: Color(0xffFCFAF3),
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          "Smart Consumer",
          style: TextStyle(
              fontSize: ScreenUtil().setSp(20),
              color: Color(0xffFCFAF3),
              fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
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
            'Đăng ký',
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

  Widget _mBodyWidget(SignUpState state) {
    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.75,
      child: Form(
        key: _textFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _formWidget(state),
            _signUpButton(),
          ],
        ),
      ),
    );
  }

  Column _formWidget(SignUpState state) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 100,
        ),
        BaseWidget.baseTextFrom(
            context: context,
            controller: _usernameController,
            currentNode: _usernameNode,
            nextNode: _phoneNode,
            hintText: 'Họ và tên',
            validator: (value) => _validatorMessage(value, 0)),
        SizedBox(
          height: ScreenUtil().setHeight(20),
        ),
        BaseWidget.baseTextFrom(
            context: context,
            controller: _phoneController,
            currentNode: _phoneNode,
            nextNode: _accountNode,
            hintText: 'Số điện thoại',
            validator: (value) => _validatorMessage(value, 1)),
        SizedBox(
          height: ScreenUtil().setHeight(20),
        ),
        BaseWidget.baseTextFrom(
            context: context,
            controller: _emailController,
            currentNode: _accountNode,
            nextNode: _passwordNode,
            hintText: 'Email',
            validator: (value) => _validatorMessage(value, 2)),
        SizedBox(
          height: ScreenUtil().setHeight(20),
        ),
        Stack(
          alignment: Alignment.centerRight,
          children: <Widget>[
            BaseWidget.baseTextFrom(
                context: context,
                isShow: state.isShow,
                controller: _passwordController,
                currentNode: _passwordNode,
                hintText: 'Mật khẩu',
                validator: (value) => _validatorMessage(value, 3)),
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
      ],
    );
  }

  Widget _signUpButton() {
    return RaisedButton(
      onPressed: () => _btnSignUpOnPress(),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      color: Colors.black87,
      splashColor: Colors.white12,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(15)),
        alignment: Alignment.center,
        child: Text(
          'ĐĂNG KÝ',
          style: TextStyle(
              fontSize: ScreenUtil().setSp(20),
              color: Color(0xffFCFAF3),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  _showPassOnPress(bool isShow) {
    BlocProvider.of<SignUpBloc>(context)
        .add(SignUpShowPassOnPressEvent(isShow));
  }

  _btnSignUpOnPress() {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (_textFormKey.currentState.validate()) {
      UserSignUp user = UserSignUp(
          _usernameController.text.trim(), _phoneController.text.trim(),
          _emailController.text.trim(), _passwordController.text.trim());
      BlocProvider.of<SignUpBloc>(context).add(BtnSignUpOnPressEvent(user));
    }
  }

  String _validatorMessage(String value, int formIndex) {
    if (value.isEmpty)
      return 'Đây là một trường bắt luộc';
    else
      switch (formIndex) {
        case 1:
          if (!Validation.validationPhone(value))
            return 'Số điện thoại phải có ít nhất 10 chữ số, bắt đầu bằng 0 hoặc'
                ' +84';
          return null;
        case 2:
          if (!Validation.validationEmail(value))
            return 'Email phải có dạng abc@opiee.com';
          return null;
        case 3:
          if (!Validation.validationStrongPassword(value))
            return 'Mật khẩu phải chứa ít nhất 8 ký tự bao gồm ít nhất 1 chữ '
                'thường, 1 chữ hoa, 1 số và 1 ký tự đặc biệt';
          return null;
      }
  }
}
