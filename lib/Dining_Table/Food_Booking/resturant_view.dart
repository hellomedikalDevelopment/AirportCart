import 'package:airportcart/app_widget/Strings.dart';
import 'package:airportcart/app_widget/app_data.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class FoodResturantViewPage extends StatefulWidget {
  @override
  _FoodResturantViewPageState createState() => _FoodResturantViewPageState();
}

class _FoodResturantViewPageState extends State<FoodResturantViewPage> {
  bool isAdded = true;
  int item = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: Column(
        children: [
          statusBar(context),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Strings.book),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.black26, BlendMode.darken))),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        appText(
                          title: 'Minnow Restrant Food King',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appText(
                              title: 'Minnow Restrant Food King',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(Icons.place_outlined, color: Colors.grey),
                                SizedBox(width: 5),
                                appText(
                                    title: 'USA, Birmingham T-7',
                                    color: Colors.grey,
                                    fontSize: 16),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(Icons.star_rate_rounded,
                                  color: Colors.yellow[700], size: 30),
                              appText(
                                title: '5.0',
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: appText(
                        title: 'About',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    child: ReadMoreText(
                      'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.',
                      trimLines: 3,
                      style: TextStyle(color: Colors.black),
                      colorClickableText: Color(0xFFFA6E5A),
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'See More',
                      trimExpandedText: 'See Less',
                      moreStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFA6E5A)),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText(
                            title: 'Full Menu',
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        InkWell(onTap: () {}, child: Icon(Icons.search))
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    color: Colors.white,
                    // padding: EdgeInsets.all(10),
                    child: ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12, blurRadius: 5)
                                ]),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)),
                                  child: Image.asset(
                                    Strings.burger2,
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      appText(
                                        title: 'Double Whooper',
                                        fontSize: 16,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      appText(
                                        title: '\$10.50',
                                        fontSize: 16,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      addButton(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget addButton() {
    return Column(
      children: [
        Visibility(
          visible: isAdded,
          child: InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xFFFA6E5A).withOpacity(0.38)),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                children: [
                  appText(
                    title: 'ADD',
                    color: AppData.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.add, color: AppData.primary)
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: !isAdded,
          child: Container(
            width: 110,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: AppData.primary),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    child: appText(
                  title: '-',
                )),
                appText(
                  title: '${item.toString()}',
                  color: Colors.white,
                  fontSize: 16,
                ),
                InkWell(child: Icon(Icons.add, color: Colors.white))
              ],
            ),
          ),
        )
      ],
    );
  }
}
