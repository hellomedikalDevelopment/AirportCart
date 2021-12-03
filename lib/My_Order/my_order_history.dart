import 'package:airportcart/My_Order/dine_in.dart';
import 'package:airportcart/My_Order/shopping.dart';
import 'package:airportcart/My_Order/sim.dart';
import 'package:airportcart/My_Order/take_away.dart';
import 'package:flutter/material.dart';
import '../app_widget/app_data.dart';
import '../app_widget/widget.dart';

class AppointmentHistoryPage extends StatefulWidget {
  @override
  _AppointmentHistoryPageState createState() => _AppointmentHistoryPageState();
}

class _AppointmentHistoryPageState extends State<AppointmentHistoryPage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppData.bgColor,
      body: Stack(
        children: [
          DefaultTabController(
            length: 5,
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.only(top: 55),
                // color: Colors.green,
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    toolbarHeight: 50,
                    backgroundColor: AppData.white,
                    backwardsCompatibility: true,
                    centerTitle: true,
                    elevation: 0,
                    automaticallyImplyLeading: false,
                    bottom: TabBar(
                      isScrollable: true,
                      indicatorWeight: 3,
                      unselectedLabelColor: AppData.grey,
                      unselectedLabelStyle: TextStyle(color: AppData.grey),
                      indicatorColor: AppData.primary,
                      labelStyle: TextStyle(color: AppData.grey),
                      tabs: [
                        Tab(
                            child: appText(
                          title: 'Shopping',
                          color: AppData.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        )),
                        Tab(
                            child: appText(
                          title: 'Dine In',
                          color: AppData.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        )),
                        Tab(
                            child: appText(
                          title: 'Take Away',
                          color: AppData.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        )),
                        Tab(
                            child: appText(
                          title: 'Spa',
                          color: AppData.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        )),
                        Tab(
                            child: appText(
                          title: 'Sim',
                          color: AppData.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        )),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      ShoppingPage(),
                      DineInPage(),
                      TakeAwayPage(),
                      Container(),
                      SimPage()
                    ],
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              statusBar(context),
              customMainAppBar(title: 'My Order', alignment: Alignment.center),
            ],
          ),
          // Container(
          //   color: Colors.yellow,
          //   height: 50,
          // )
        ],
      ),
    );
  }
}
