import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConsumptionUI {
  IconData icon;
  String title;

  ConsumptionUI({this.icon, this.title});
}

Map<int, ConsumptionUI> consumptionUIGroupMap = {
  0: ConsumptionUI(icon: FontAwesomeIcons.questionCircle, title: 'Chọn nhóm tiêu dùng'),
  10: ConsumptionUI(icon: FontAwesomeIcons.graduationCap, title: 'Giáo dục'),
  11: ConsumptionUI(icon: FontAwesomeIcons.utensils, title: 'Ăn uống'),
  12: ConsumptionUI(icon: FontAwesomeIcons.fileInvoiceDollar, title: 'Hóa đơn'),
  13: ConsumptionUI(icon: FontAwesomeIcons.car, title: 'Di chuyển'),
  14: ConsumptionUI(icon: FontAwesomeIcons.shoppingBasket, title: 'Mua sắm'),
  15: ConsumptionUI(icon: FontAwesomeIcons.heart, title: 'Bạn bè & người yêu'),
  16: ConsumptionUI(icon: FontAwesomeIcons.gamepad, title: 'Giải trí'),
  17: ConsumptionUI(icon: FontAwesomeIcons.planeDeparture, title: 'Du lịch'),
  18: ConsumptionUI(icon: FontAwesomeIcons.briefcaseMedical, title: 'Sức khỏe'),
  19: ConsumptionUI(icon: FontAwesomeIcons.handHoldingUsd, title: 'Từ thiện'),
  110: ConsumptionUI(icon: FontAwesomeIcons.chartLine, title: 'Đầu tư'),
  111: ConsumptionUI(icon: FontAwesomeIcons.businessTime, title: 'Kinh doanh'),
  112: ConsumptionUI(icon: FontAwesomeIcons.box, title: 'Khoảng chi khác'),
  20: ConsumptionUI(icon: FontAwesomeIcons.award, title: 'Thưởng'),
  21: ConsumptionUI(icon: FontAwesomeIcons.percent, title: 'Tiền lãi'),
  22: ConsumptionUI(icon: FontAwesomeIcons.moneyBillWave, title: 'Lương'),
  23: ConsumptionUI(icon: FontAwesomeIcons.gift, title: 'Quà tặng'),
  24: ConsumptionUI(icon: FontAwesomeIcons.funnelDollar, title: 'Bán đồ'),
  25: ConsumptionUI(icon: FontAwesomeIcons.box, title: 'Khoảng thu khác'),
  30: ConsumptionUI(title: 'Đi vay'),
  31: ConsumptionUI(title: 'Thu nợ'),
  32: ConsumptionUI(title: 'Cho vay'),
  33: ConsumptionUI(title: 'Trả nợ'),
};