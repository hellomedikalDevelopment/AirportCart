import 'package:airportcart/Maine_Home_page.dart';
import 'package:airportcart/My_Order/my_order_history.dart';
import 'package:airportcart/app_widget/app_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_widget/app_data.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  final List<Widget> airport = [
    HomePage(),
    Container(),
    Container(),
    AppointmentHistoryPage(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: airport[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: AppData.greyLight, width: 1)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            selectedFontSize: 12,
            unselectedFontSize: 10,
            backgroundColor: AppData.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppData.primary,
            unselectedItemColor: AppData.grey,
            showUnselectedLabels: true,
            onTap: (i) => setState(() => currentIndex = i),
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                activeIcon: Icon(Icons.home_outlined),
                icon: Icon(Icons.home_outlined),
              ),
              BottomNavigationBarItem(
                label: 'Cart',
                activeIcon: Icon(Icons.shopping_cart_outlined),
                icon: Icon(Icons.shopping_cart_outlined),
              ),
              BottomNavigationBarItem(
                label: 'Favorites',
                activeIcon: Icon(Icons.favorite_border),
                icon: Icon(Icons.favorite_border),
              ),
              BottomNavigationBarItem(
                label: 'My Order',
                activeIcon: Icon(Icons.history),
                icon: Icon(Icons.history),
              ),
              BottomNavigationBarItem(
                label: 'Settings',
                activeIcon: Icon(CupertinoIcons.gear),
                icon: Icon(CupertinoIcons.gear),
              ),
            ],
          ),
        ),
      ),

      // bottomNavigationBar: BottomNavyBar(
      //   selectedIndex: currentIndex,
      //   showElevation: true,
      //   itemCornerRadius: 20,
      //   containerHeight: 50,
      //   animationDuration: Duration(milliseconds: 1000),
      //   curve: Curves.fastOutSlowIn,
      //   onItemSelected: (index) => setState(() {
      //     currentIndex = index;
      //   }),
      //   items: [
      //     BottomNavyBarItem(
      //       icon: Icon(Icons.home),
      //       title: Text('Home'),
      //       activeColor: Colors.red,
      //       textAlign: TextAlign.center,
      //     ),
      //     BottomNavyBarItem(
      //       icon: Icon(Icons.notifications),
      //       title: Text('Notifications'),
      //       activeColor: Colors.purpleAccent,
      //       textAlign: TextAlign.center,
      //     ),
      //     BottomNavyBarItem(
      //       icon: Icon(Icons.watch_later_outlined),
      //       title: Text(
      //         'Time',
      //       ),
      //       activeColor: Colors.pink,
      //       textAlign: TextAlign.center,
      //     ),
      //     BottomNavyBarItem(
      //       icon: Icon(Icons.settings),
      //       title: Text('Settings'),
      //       activeColor: Colors.blue,
      //       textAlign: TextAlign.center,
      //     ),
      //   ],
      // ),
    );
  }
}
