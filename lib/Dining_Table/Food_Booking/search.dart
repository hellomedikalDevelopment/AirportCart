import 'package:airportcart/app_widget/widget.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          statusBar(context),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appText(
                  title: 'Search',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                CloseButton(
                  color: Colors.black,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          kTextField(
            hint: 'Burger',
            icon: Icon(Icons.search),
            border: Border.all(color: Colors.grey[400], width: 1.5),
            radius: 8,
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: appText(
              title: 'Recent searches',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: appText(
                      title: 'Burger',
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                );
              })
        ],
      ),
    );
  }
}
