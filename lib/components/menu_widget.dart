import 'package:flutter/material.dart';
import 'package:bobo_ui/helper/ui_helper.dart';

/// Drawer Menu
class MenuWidget extends StatelessWidget {
  final menuItems = ['Club', 'Event', 'Crew', 'Taxi', 'Payment', 'Reservation', ];

  final num currentMenuPercent;
  final Function(bool) animateMenu;

  MenuWidget({Key key, this.currentMenuPercent, this.animateMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return currentMenuPercent != 0
        ? Positioned(
            left: realW(-358 + 358 * currentMenuPercent),
            width: realW(358),
            height: screenHeight,
            child: Opacity(
              opacity: currentMenuPercent,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(realW(50))),
                  boxShadow: [
                    BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.16), blurRadius: realW(20)),
                  ],
                ),
                child: Stack(
                  children: <Widget>[
                    NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (notification) {
                        notification.disallowGlow();
                      },
                      child: CustomScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        slivers: <Widget>[
                          SliverToBoxAdapter(
                            child: Container(
                              height: realH(236),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(realW(50))),
                                  gradient: const LinearGradient(begin: Alignment.topLeft, colors: [
                                    Color(0xFF59C2FF),
                                    Color(0xFF1270E3),
                                  ])),
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    left: realW(10),
                                    bottom: realH(27),
                                    child: Image.asset(
                                      "assets/avatar.png",
                                      width: realH(120),
                                      height: realH(120),
                                    ),
                                  ),
                                  Positioned(
                                    left: realW(60),
                                    bottom: realH(18),
                                    child: Image.asset(
                                      "assets/lable.png",
                                      width: realH(72),
                                      height: realH(72),
                                    ),
                                  ),
                                  Positioned(
                                    left: realW(135),
                                    top: realH(110),
                                    child: DefaultTextStyle(
                                      style: TextStyle(color: Colors.white),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Bobo",
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: realW(18)),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(vertical: realH(11.0)),
                                            child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Text.rich(
                                                TextSpan(
                                                  text: "josh.chirchir96@gmail.com",
                                                  style: TextStyle(
                                                      fontSize: realW(16), decoration: TextDecoration.underline),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                "Joshua Chirchir",
                                                style: TextStyle(fontSize: realW(14)),
                                              ),
                                              Icon(
                                                Icons.arrow_right,
                                                color: Colors.white,
                                                size: realH(30),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SliverPadding(
                            padding: EdgeInsets.only(top: realH(34), bottom: realH(50), right: realW(37)),
                            sliver: SliverFixedExtentList(
                              itemExtent: realH(56),
                              delegate: new SliverChildBuilderDelegate((BuildContext context, int index) {
                                String _routPath = '/';
                                switch (menuItems[index]) {
                                  case 'Club':
                                    _routPath = '/club';
                                    break;
                                  case 'Event':
                                    _routPath = '/event';
                                    break;
                                  case 'Crew':
                                    _routPath = '/crew';
                                    break;
                                  case 'Taxi':
                                    _routPath = '/taxi';
                                    break;
                                  case 'Payment':
                                    _routPath = '/payment';
                                    break;
                                  case 'Reservation':
                                    _routPath = '/reservation';
                                    break;
                                  default:
                                  _routPath = '/';
                                }
                                //创建列表项
                                return InkWell(
                                  onTap: (){
                                    Navigator.of(context).pushNamed(_routPath);
                                  },
                                  child: Container(
                                    width: realW(321),
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(left: realW(20)),
                                    decoration: index == 0
                                        ? BoxDecoration(
                                            color: Color(0xFF379BF2).withOpacity(0.2),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(realW(50)),
                                                bottomRight: Radius.circular(realW(50))))
                                        : null,
                                    child: Text(
                                      menuItems[index],
                                      style:
                                          TextStyle(color: index == 0 ? Colors.blue : Colors.black, fontSize: realW(20)),
                                    ),
                                  ),
                                );
                              }, childCount: menuItems.length),
                            ),
                          ),
                          SliverPadding(
                            padding: EdgeInsets.only(left: realW(20)),
                            sliver: SliverToBoxAdapter(
                              child: InkWell(
                                onTap: (){
                                  Navigator.of(context).pushNamed('/settings');
                                },
                                child: Text(
                                  'Settings',
                                  style: TextStyle(color: Colors.black, fontSize: realW(20)),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    // close button
                    Positioned(
                      bottom: realH(53),
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          animateMenu(false);
                        },
                        child: Container(
                          width: realW(71),
                          height: realH(71),
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: realW(17)),
                          child: Icon(
                            Icons.close,
                            color: Color(0xFFE96977),
                            size: realW(34),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFFB5E74).withOpacity(0.2),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(realW(36)), topLeft: Radius.circular(realW(36))),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : const Padding(padding: EdgeInsets.all(0));
  }
}
