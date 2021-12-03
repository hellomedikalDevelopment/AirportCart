import 'package:airportcart/app_widget/Strings.dart';
import 'package:airportcart/app_widget/app_data.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          statusBar(context),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Icon(Icons.arrow_back_ios_rounded),
                ),
                TextButton(
                    onPressed: () {},
                    child: appText(
                        title: 'Clear All', fontWeight: FontWeight.bold))
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appText(
                  title: 'Notifications',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 10),
                ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 2)
                            ]),
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(Strings.kfc_logo),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      appText(
                                          title: 'KFC',
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                      Icon(Icons.circle,
                                          color: AppData.primary, size: 10),
                                      appText(
                                          title: 'NOW',
                                          color: AppData.primary,
                                          fontWeight: FontWeight.bold),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                                appText(
                                  title: 'USA, Birmingham T-7',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                                SizedBox(height: 5),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.65,
                                  child: appText(
                                      title:
                                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                      maxLines: 2),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {},
                              child: Icon(Icons.close),
                            )
                          ],
                        ),
                      );
                    }),
                // Container(
                //   height: 150,
                //   width: 150,
                //   child: Image.asset(Strings.empty_notification),
                // ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
