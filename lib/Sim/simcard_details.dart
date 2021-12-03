
import 'package:airportcart/Sim/plan_details.dart';
import 'package:airportcart/app_widget/Strings.dart';
import 'package:airportcart/app_widget/app_data.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class SimCardDetails extends StatefulWidget {
  @override
  _SimCardDetailsState createState() => _SimCardDetailsState();
}

class _SimCardDetailsState extends State<SimCardDetails> {
  String selectCategory = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          statusBar(context),
          customMainAppBar(
              title: 'Sim Card',
              onTab: () {
                Navigator.pop(context);
              },
              icon: Icons.arrow_back_ios_rounded,
              trailing: Icons.filter_list_rounded,
              onPressed: () {
                filter();
              }),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 75,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.shade200,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: appText(
                              title: 'Current',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined,
                                  color: AppData.primary),
                              SizedBox(width: 8),
                              appText(
                                  title: 'Airport USA, Birmingham T-7',
                                  color: AppData.primary),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward_ios_outlined,
                                  color: AppData.primary, size: 14),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount: simList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      return businessLounge(simList, i);
                    },
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget businessLounge(simList, i) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppData.white,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  Strings.sim_logo,
                  width: 50,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    appText(
                        title: simList[i]['title'],
                        fontWeight: FontWeight.bold,
                        color: AppData.black,
                        fontSize: 14),
                    SizedBox(height: 8),
                    appText(
                        title: '\$30.00',
                        color: AppData.greyDark,
                        fontSize: 14),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            customButton(
              title: 'See Details & Buy Now',
              radius: 25,
              onTap: () {
                // getLocation();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PlanDetails()));
              },
            ),
          ],
        ),
      ),
    );
  }

  void filter() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.2,
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 20, 20, 15),
            decoration: BoxDecoration(
              color: AppData.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              boxShadow: [
                new BoxShadow(
                  // color: AppData.mainblue,
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: appText(
                      title: 'Select Filter',
                      color: AppData.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    country();

                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appText(
                                title: 'Select Country',
                                color: AppData.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                            SizedBox(height: 5),
                            appText(
                                title:
                                    'Which Country Sim do you want please Select ',
                                color: AppData.grey,
                                // fontWeight: FontWeight.w500,
                                fontSize: 10),
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  country() {
    return showCountryPicker(
      context: context,
      countryListTheme: CountryListThemeData(
        flagSize: 25,
        backgroundColor: AppData.white,
        textStyle: TextStyle(fontSize: 16, color: Colors.blueGrey),
        //Optional. Sets the border radius for the bottomsheet.
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        //Optional. Styles the search field.
        inputDecoration: InputDecoration(
          labelText: 'Search',
          hintText: 'Start typing to search',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color(0xFF8C98A8).withOpacity(0.2),
            ),
          ),
        ),
      ),
      onSelect: (Country country) =>
          print('Select country: ${country.displayName}'),
    );
  }

  List<Map<String, dynamic>> simList = [
    {'title': 'Oman Prepaid SIM'},
    {'title': 'UK Prepaid SIM for Students'},
    {'title': 'Germany Prepaid SIM for Students'},
    {'title': 'UK+Europe Prepaid SIM'},
  ];
}
