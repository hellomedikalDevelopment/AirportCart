import 'package:airportcart/Shopping_Experience/product.dart';
import 'package:flutter/material.dart';

import '../app_widget/Strings.dart';
import '../app_widget/app_data.dart';
import '../app_widget/widget.dart';

class BrandDetail extends StatefulWidget {
  @override
  _BrandDetailState createState() => _BrandDetailState();
}

class _BrandDetailState extends State<BrandDetail> {
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
              title: 'Back',
              icon: Icons.arrow_back_ios,
              onTab: () {
                Navigator.pop(context);
              },
              onPressed: () {},
              trailing: Icons.search),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: appText(
              title: 'Select Footwear Brand',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppData.black,
            ),
          ),
          Expanded(
            child: Container(
              // height: 165,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                // scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return cat(categories, i);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget cat(data, i) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Product()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        // height: 300,
        // width: 100,
        decoration: BoxDecoration(
          color: AppData.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppData.greyLight, width: 0.5),
          // boxShadow: [BoxShadow(color: AppData.grey, blurRadius: 2)
          // ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0)),
              child: Image.asset(
                data[i]['image'],
                // color: (select == data[i]['id'])
                //     ? AppData.white
                //     : AppData.primary,
                height: 180,
                width: MediaQuery.of(context).size.width * 1,
                fit: BoxFit.cover,
                // width: 70,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appText(
                          title: data[i]['name'],
                          fontSize: 16,
                          color: AppData.black),
                      SizedBox(height: 5),
                      appText(
                        title: 'Open Now',
                        fontSize: 14,
                        color: AppData.green,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(Strings.call,height: 30,),
                      // Container(
                      //     width: 30,
                      //     height: 30,
                      //     decoration: BoxDecoration(
                      //       color: AppData.white,
                      //       borderRadius: BorderRadius.circular(25),
                      //       border: Border.all(color: Colors.blue, width: 1),
                      //       // boxShadow: [BoxShadow(color: AppData.grey, blurRadius: 2)
                      //       // ],
                      //     ),
                      //     child: Icon(
                      //       Icons.phone_callback_sharp,
                      //       color: Colors.blue,
                      //       size: 18,
                      //     )),
                      SizedBox(width: 5),
                      appText(
                        title: 'Call',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
              child: appText(
                title: data[i]['desc'],
                fontSize: 12,
                maxLines: 5,
                color: AppData.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> categories = [
  {
    'image': Strings.brand_1,
    'name': 'Nike Brand',
    'desc':
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standaed text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
  },
  {
    'image': Strings.brand_2,
    'name': 'Adidas Brand',
    'desc':
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standaed text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
  },
  {
    'image': Strings.brand_1,
    'name': 'Nike Brand',
    'desc':
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standaed text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
  },
  {
    'image': Strings.brand_2,
    'name': 'Adidas Brand',
    'desc':
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standaed text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
  },
  {
    'image': Strings.brand_1,
    'name': 'Nike Brand',
    'desc':
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standaed text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
  },
];
