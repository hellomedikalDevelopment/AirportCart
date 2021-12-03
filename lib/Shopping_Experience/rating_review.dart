import 'package:airportcart/Shopping_Experience/mycart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../app_widget/Strings.dart';
import '../app_widget/app_data.dart';
import '../app_widget/widget.dart';

class RatingReview extends StatefulWidget {
  const RatingReview({Key key}) : super(key: key);

  @override
  _RatingReviewState createState() => _RatingReviewState();
}

class _RatingReviewState extends State<RatingReview> {
  TextEditingController search = TextEditingController();
  Map<String, bool> numbers = {
    'Adidas': false,
    'Nike': false,
    'Puma': false,
    'Skechers': false,
  };
  bool checkedValue = false;

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
            title: 'Rating & Review',
            alignment: Alignment.center,
            icon: Icons.arrow_back_ios,
            onTab: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            appText(
                                title: '4.3',
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                                color: AppData.black),
                            appText(
                                title: '23 ratings',
                                fontSize: 16,
                                color: AppData.grey),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset(Strings.star5, height: 12),
                            SizedBox(height: 3),
                            Image.asset(Strings.star4, height: 12),
                            SizedBox(height: 3),
                            Image.asset(Strings.star3, height: 12),
                            SizedBox(height: 3),
                            Image.asset(Strings.star2, height: 12),
                            SizedBox(height: 3),
                            Image.asset(Strings.star1, height: 12),
                          ],
                        ),
                        Column(
                          children: [
                            percentIndicator(context, percent: 1),
                            SizedBox(height: 8),
                            percentIndicator(context, percent: 0.33),
                            SizedBox(height: 8),
                            percentIndicator(context, percent: 0.25),
                            SizedBox(height: 8),
                            percentIndicator(context, percent: 0.15),
                            SizedBox(height: 8),
                            percentIndicator(context, percent: 0.01),
                          ],
                        ),
                        Column(
                          children: [
                            appText(
                                title: '12',
                                fontSize: 10,
                                color: AppData.greyDark),
                            SizedBox(height: 4),
                            appText(
                                title: '5',
                                fontSize: 10,
                                color: AppData.greyDark),
                            SizedBox(height: 4),
                            appText(
                                title: '4',
                                fontSize: 10,
                                color: AppData.greyDark),
                            SizedBox(height: 4),
                            appText(
                                title: '2',
                                fontSize: 10,
                                color: AppData.greyDark),
                            SizedBox(height: 4),
                            appText(
                                title: '0',
                                fontSize: 10,
                                color: AppData.greyDark),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText(
                            title: '10 Review',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppData.black),
                        Row(
                          children: [
                            Checkbox(
                              value: this.checkedValue,
                              onChanged: (bool value) {
                                setState(() {
                                  this.checkedValue = value;
                                });
                              },
                            ),
                            appText(
                                title: 'With photo',
                                fontSize: 14,
                                color: AppData.greyDark),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      child: ListView.builder(
                        itemCount: rating.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        // scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          return rate(rating, i);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget percentIndicator(BuildContext context, {double percent}) {
    return LinearPercentIndicator(
      animation: true,
      lineHeight: 8,
      width: MediaQuery.of(context).size.width * 0.4,
      animationDuration: 1200,
      percent: percent,
      linearStrokeCap: LinearStrokeCap.round,
      backgroundColor: Colors.transparent,
      progressColor: AppData.primary,
    );
  }

  Widget rate(rating, i) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyCart()));
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          rating[i]['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appText(
                            title: rating[i]['name'],
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppData.black),
                        Image.asset(Strings.rating4, height: 18),
                      ],
                    ),
                  ],
                ),
                appText(
                    title: rating[i]['date'],
                    fontSize: 12,
                    color: AppData.grey),
              ],
            ),
            SizedBox(height: 8),
            appText(
                title: rating[i]['desc'],
                fontSize: 14,
                maxLines: 6,
                letterSpacing: 0.5,
                color: AppData.greyDark),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  appText(
                      title: 'Helpful',
                      fontSize: 12,
                      maxLines: 5,
                      color: AppData.grey),
                  SizedBox(width: 5),
                  Icon(
                    Icons.thumb_up_alt,
                    color: AppData.grey,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> rating = [
  {
    'image': Strings.user,
    'name': 'Helene Moore',
    'desc':
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
    'date': '21 May, 2021'
  },
  {
    'image': Strings.user,
    'name': 'Helene Moore',
    'desc':
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
    'date': '21 May, 2021'
  },
  {
    'image': Strings.user,
    'name': 'Helene Moore',
    'desc':
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
    'date': '21 May, 2021'
  },
  {
    'image': Strings.user,
    'name': 'Helene Moore',
    'desc':
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
    'date': '21 May, 2021'
  },
];
