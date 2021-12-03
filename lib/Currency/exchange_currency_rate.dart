import 'package:airportcart/app_widget/Strings.dart';
import 'package:airportcart/app_widget/app_data.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExchangeCurrencyRate extends StatefulWidget {
  @override
  _ExchangeCurrencyRateState createState() => _ExchangeCurrencyRateState();
}

class _ExchangeCurrencyRateState extends State<ExchangeCurrencyRate> {
  TextEditingController rate = TextEditingController();
  dynamic rateFrom;
  dynamic rateTo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppData.bgColor,
      body: Column(
        children: [
          statusBar(context),
          customMainAppBar(
            title: 'Currency Rate',
            alignment: Alignment.center,
            onTab: () {
              Navigator.pop(context);
            },
            icon: Icons.arrow_back_ios,
          ),
          // details(),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // alignment: Alignment.bottomLeft,
                      width: 200,
                      child: appText(
                        title: 'Choose Any One Category',
                        maxLines: 2,
                        fontSize: 22,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 20),
                    details(),
                    SizedBox(height: 20),
                    walletTextField(
                      label: 'Enter Amount',
                      controller: rate,
                      hintText: 'Amount',
                      keybord: TextInputType.number,
                      // suffixIcon: Icon(FeatherIcons.user, color: AppData.black),
                    ),
                    SizedBox(height: 100),
                    customButton(
                      title: 'Get Rate',
                      margin: 30,
                      textColor: AppData.white,
                      radius: 25,
                      onTap: () {
                        dialogButton();
                      },
                    ),
                    SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget details() {
    return Container(
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                      color: AppData.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 5,
                    color: AppData.primary.withOpacity(0.38),
                  ),
                  Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                      color: AppData.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image:
                        DecorationImage(image: AssetImage(Strings.bg_round))),
                child: RotatedBox(
                  quarterTurns: 90,
                  child: Icon(Icons.autorenew_rounded, color: AppData.white),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              fromTO(from: 'Currency Convert from', val: rateFrom),
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  Container(
                    color: AppData.greyLight,
                    height: 2,
                    width: MediaQuery.of(context).size.width * 0.71,
                  ),
                  // InkWell(
                  //   onTap: () {},
                  //   child: Container(
                  //     height: 60,
                  //     width: 60,
                  //     decoration: BoxDecoration(
                  //         shape: BoxShape.circle,
                  //         image: DecorationImage(
                  //           image: AssetImage(Strings.bg_round),
                  //         )),
                  //     child:
                  //         Icon(Icons.autorenew_rounded, color: AppData.white),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 20),
              fromTO(from: 'Currency Convert to', val: rateTo),
            ],
          ),
        ],
      ),
    );
  }

  Widget fromTO({String from, dynamic val}) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appText(
            title: from,
            fontSize: 14,
            color: Color(0xFF646464),
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                // color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 0.2,
                  color: Colors.grey.shade200,
                )),
            child: DropdownButtonFormField(
              icon: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: const Icon(
                  Icons.keyboard_arrow_down,
                  color: AppData.black,
                ),
              ),
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                hintText: 'Select Currency',
              ),
              value: val,
              onChanged: (value) {
                setState(() {
                  val = value;
                });
              },
              items: <String>[
                'USD',
                'EUR',
                'GBP',
                'INR',
              ].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  dialogButton() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            titlePadding: EdgeInsets.all(0),
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: appText(
                            title: 'Currency Rate',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppData.primary),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.cancel_sharp,
                          color: AppData.primary,
                          size: 24,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                  appText(
                      title: 'Here Your Currency Conversion Rate',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppData.primary),
                  SizedBox(height: 20),
                  appText(
                      title: '100 USD = 71.20 INR',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppData.black),
                  SizedBox(height: 20),
                  customButton(
                    title: 'Get Rate',
                    textColor: AppData.white,
                    radius: 25,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
