import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  static Widget selectConsumerGroup(int selectIndex) {
    switch(selectIndex) {
      case 0:
        return expenseGridViewWidget();
      case 1:
        return incomeGridViewWidget();
      case 2:
        return debtGridViewWidget();

    }
  }

  static Widget debtGridViewWidget() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      primary: false,
      children: <Widget>[
        debtElementWidget('Đi vay'),
        debtElementWidget('Thu nợ'),
        debtElementWidget('Cho vay'),
        debtElementWidget('Trả nợ'),
      ],);
  }

  static Widget debtElementWidget(String title) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.black26,width: 1.5)
      ),
      alignment: Alignment.center,
      child: Text('$title', style: TextStyle(
          fontSize: ScreenUtil().setSp(24),
          color: Colors.black87,
          fontWeight: FontWeight.w500
      ),),
    );
  }

  static incomeGridViewWidget() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 4.0,
      mainAxisSpacing: 8.0,
      primary: false,
      children: <Widget>[
        exchangeElementWidget(FontAwesomeIcons.award, 'Thưởng'),
        exchangeElementWidget(FontAwesomeIcons.percent, 'Tiền lãi'),
        exchangeElementWidget(FontAwesomeIcons.moneyBillWave, 'Lương'),
        exchangeElementWidget(FontAwesomeIcons.gift, 'Được tặng'),
        exchangeElementWidget(FontAwesomeIcons.sellsy, 'Thưởng'),
        exchangeElementWidget(FontAwesomeIcons.box, 'Khoản thu khác'),
      ],);
  }

  static expenseGridViewWidget() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 4.0,
      mainAxisSpacing: 8.0,
      primary: false,
      children: <Widget>[
        exchangeElementWidget(FontAwesomeIcons.graduationCap, 'Giáo dục'),
        exchangeElementWidget(FontAwesomeIcons.utensils, 'Ăn uống'),
        exchangeElementWidget(FontAwesomeIcons.fileInvoiceDollar, 'Hóa đơn'),
        exchangeElementWidget(FontAwesomeIcons.car, 'Di chuyển'),
        exchangeElementWidget(FontAwesomeIcons.shoppingBasket, 'Mua sắm'),
        exchangeElementWidget(FontAwesomeIcons.heart, 'Bạn bè & người yêu'),
        exchangeElementWidget(FontAwesomeIcons.gamepad, 'Giải trí'),
        exchangeElementWidget(FontAwesomeIcons.planeDeparture, 'Du lịch'),
        exchangeElementWidget(FontAwesomeIcons.briefcaseMedical, 'Sức khỏe'),
        exchangeElementWidget(FontAwesomeIcons.handHoldingUsd, 'Quyên tặng'),
        exchangeElementWidget(FontAwesomeIcons.chartLine, 'Đầu tư'),
        exchangeElementWidget(FontAwesomeIcons.businessTime, 'Kinh doanh'),
        exchangeElementWidget(FontAwesomeIcons.box, 'Khoản chi khác'),
      ],);
  }

  static exchangeElementWidget(IconData icon, String title) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.black26,width: 1.5)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: Colors.black87, size: ScreenUtil().setSp(28),),
          SizedBox(
            height: ScreenUtil().setHeight(5),
          ),
          Text('$title', style: TextStyle(
            color: Colors.black87,
            fontSize: ScreenUtil().setSp(18),
            fontWeight: FontWeight.w500
          ),
          textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
