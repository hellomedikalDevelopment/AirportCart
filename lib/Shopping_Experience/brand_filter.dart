import 'package:flutter/material.dart';

import '../app_widget/app_data.dart';
import '../app_widget/widget.dart';

class BrandFilter extends StatefulWidget {
  @override
  _BrandFilterState createState() => _BrandFilterState();
}

class _BrandFilterState extends State<BrandFilter> {
  TextEditingController search = TextEditingController();
  Map<String, bool> numbers = {
    'Adidas': false,
    'Nike': false,
    'Puma': false,
    'Skechers': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppData.bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          statusBar(context),
          customMainAppBar(
            title: 'Brand',
            alignment: Alignment.center,
            icon: Icons.arrow_back_ios,
            onTab: () {
              Navigator.pop(context);
            },
          ),

          Container(
            padding: EdgeInsets.only(top: 20),
            child: searchbar(
              context: context,
              controller: search,
              prefix: Icon(
                Icons.search_outlined,
                color: AppData.grey,
              ),
              suffiximage: Padding(
                padding: const EdgeInsets.all(6),
                child: GestureDetector(
                  child: Icon(Icons.mic_none_rounded),
                  onTap: () {},
                ),
              ),
              hint: 'Search....',
            ),
          ),
          Expanded(
            child: Container(
              height: 400,
              child: ListView(
                children: numbers.keys.map((String key) {
                  return new CheckboxListTile(
                    title: new Text(key),
                    value: numbers[key],
                    dense: true,
                    activeColor: AppData.primary,
                    checkColor: AppData.white,
                    onChanged: (bool value) {
                      setState(() {
                        numbers[key] = value;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          ),
          Divider(height: 20),
          Container(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: customButton(
                        margin: 0,
                        title: 'Cancel',
                        radius: 25,
                        textSize: 14,
                        borderColor: AppData.grey,
                        color: AppData.bgColor,
                        textColor: AppData.greyDark,
                        onTap: () {
                          // Navigator.pop(context);
                        }),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: customButton(
                        margin: 0,
                        title: 'Apply',
                        radius: 25,
                        textSize: 14,
                        borderColor: AppData.primary,
                        color: AppData.primary,
                        textColor: AppData.white,
                        onTap: () {
                          // Navigator.pop(context);
                        }),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          // appText(title: 'Price Range', fontSize: 14, color: AppData.black),
          // Divider(height: 20),
        ],
      ),
    );
  }
}
