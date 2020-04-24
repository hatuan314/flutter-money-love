import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class BaseWidget {
  static TextFormField baseTextFrom(
      {BuildContext context,
      TextEditingController controller,
      bool isShow = false,
      FocusNode currentNode,
      FocusNode nextNode,
      String hintText,
      FormFieldValidator<String> validator}) {
    return TextFormField(
      controller: controller,
      style: TextStyle(fontSize: ScreenUtil().setSp(23), color: Colors.black87),
      obscureText: isShow,
      focusNode: currentNode,
      onFieldSubmitted: (term) {
        currentNode.unfocus();
        if (nextNode != null) FocusScope.of(context).requestFocus(nextNode);
      },
      textInputAction: TextInputAction.next,
      cursorColor: Colors.black87,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black38,
          fontSize: ScreenUtil().setSp(23),
        ),
        contentPadding: new EdgeInsets.symmetric(
            vertical: ScreenUtil().setHeight(15),
            horizontal: ScreenUtil().setWidth(30)),
        errorStyle: TextStyle(
          color: Colors.red,
          fontSize: ScreenUtil().setSp(16),
        ),
        errorBorder: formBoder(color: Colors.red),
        focusedErrorBorder: formBoder(color: Colors.red),
        enabledBorder: formBoder(color: Colors.black87),
        focusedBorder: formBoder(color: Colors.black87),
      ),
      validator: (value) => validator(value),
    );
  }

  static InputBorder formBoder({Color color = Colors.black87}) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: color, width: ScreenUtil().setWidth(1.2)),
        borderRadius: BorderRadius.all(Radius.circular(30)));
  }
}
