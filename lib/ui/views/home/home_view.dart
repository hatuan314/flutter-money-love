import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moneyloveapp/ui/my_ui.dart';

class HomeView extends StatelessWidget {
  PageController _pageController;
  MenuPositionController _menuPositionController;
  bool userPageDragging = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _menuPositionController = MenuPositionController(initPosition: 0);

    _pageController =
        PageController(initialPage: 0, keepPage: false, viewportFraction: 1.0);
    _pageController.addListener(handlePageChange);
    return Scaffold(
      backgroundColor: Color(0xffFCFAF3),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          return checkUserDragging(scrollNotification);
        },
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height - 60,
              child: PageView(
                controller: _pageController,
                children: [
                  HistoryPageView(),
                  StatisticPageView(),
                  AccountPageView()
                ],
                onPageChanged: (page) {},
              ),
            ),
            Container(
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(20)),
                  color: Colors.indigo),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: BubbledNavigationBar(
                  controller: _menuPositionController,
                  initialIndex: 0,
                  itemMargin: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(15)),
                  backgroundColor: Colors.indigo,
                  defaultBubbleColor: Colors.indigoAccent,
                  iconRightMargin: 10,
                  onTap: (index) {
                    _pageController.animateToPage(index,
                        curve: Curves.easeInOutQuad,
                        duration: Duration(milliseconds: 500));
                  },
                  items: [
                    BubbledNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.wallet,
                          size: 24,
                          color: Color(0xffFCFAF3)),
                      activeIcon: Icon(FontAwesomeIcons.wallet,
                          size: 24,
                          color: Color(0xffFCFAF3)),
                      title: Text(
                        'Sổ chi tiêu',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    BubbledNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.chartPie,
                          size: 24,
                          color: Color(0xffFCFAF3)),
                      activeIcon: Icon(FontAwesomeIcons.chartPie,
                          size: 24,
                          color: Color(0xffFCFAF3)),
                      title: Text(
                        'Báo cáo',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    BubbledNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.user,
                          size: 24,
                          color: Color(0xffFCFAF3)),
                      activeIcon: Icon(FontAwesomeIcons.user,
                          size: 24,
                          color: Color(0xffFCFAF3)),
                      title: Text(
                        'Tài khoản',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void handlePageChange() {
    _menuPositionController.absolutePosition = _pageController.page;
  }

  bool checkUserDragging(ScrollNotification scrollNotification) {
    if (scrollNotification is UserScrollNotification &&
        scrollNotification.direction != ScrollDirection.idle) {
      userPageDragging = true;
    } else if (scrollNotification is ScrollEndNotification) {
      userPageDragging = false;
    }
    if (userPageDragging) {
      _menuPositionController.findNearestTarget(_pageController.page);
    }

    return userPageDragging;
  }
}
