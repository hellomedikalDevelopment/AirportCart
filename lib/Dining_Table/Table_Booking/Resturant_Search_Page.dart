import 'package:airportcart/app_widget/Strings.dart';
import 'package:airportcart/app_widget/app_data.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:flutter/material.dart';

class ResturantSearchPage extends StatefulWidget {
  @override
  _ResturantSearchPageState createState() => _ResturantSearchPageState();
}

class _ResturantSearchPageState extends State<ResturantSearchPage> {
  TextEditingController search = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController search2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          statusBar(context),
          customMainAppBar(
              title: 'Search',
              onTab: () {
                Navigator.pop(context);
              },
              icon: Icons.arrow_back_ios_rounded),
          searchbar(
            context: context,
            controller: search,
            prefix: Container(
              height: 50,
              width: 50,
              child: Center(child: appText(title: 'What?', color: Colors.grey)),
            ),
            icon: Icon(Icons.clear, color: Colors.grey),
            onTap: () {},
          ),
          searchbar(
            context: context,
            controller: search2,
            prefix: Container(
              height: 50,
              width: 50,
              child:
                  Center(child: appText(title: 'Where?', color: Colors.grey)),
            ),
            icon: Icon(Icons.my_location, color: Colors.grey),
            onTap: () {},
          ),
          Expanded(
              child: Column(
            children: [
              searchFood(
                controller: location,
                hint: 'Enter Resturant',
                color: AppData.primary,
                prefixicon: Icon(
                  Icons.search,
                  color: AppData.primary,
                ),
                ontap: () {},
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, i) {
                      return resturantList();
                    },
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }

  Widget resturantList() {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.grey.shade400, width: 1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(Strings.list1),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                appText(
                  title: 'Japness Food Resturant',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
                SizedBox(height: 5),
                appText(title: 'Japness Food'),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    SizedBox(width: 3),
                    appText(title: '5.0'),
                    SizedBox(width: 3),
                    appText(
                      title: '(210 review)',
                      color: Colors.black54,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(width: 10),
            IconButton(
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                color: AppData.primary,
                size: 18,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
