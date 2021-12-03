import 'package:airportcart/Dining_Table/input_formatters.dart';
import 'package:airportcart/Sim/complete_sim.dart';
import 'package:airportcart/app_widget/app_data.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:credit_card_slider/card_background.dart';
import 'package:credit_card_slider/card_company.dart';
import 'package:credit_card_slider/card_network_type.dart';
import 'package:credit_card_slider/credit_card_widget.dart';
import 'package:credit_card_slider/validity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SimPaymentPage extends StatefulWidget {
  @override
  _SimPaymentPageState createState() => _SimPaymentPageState();
}

class _SimPaymentPageState extends State<SimPaymentPage> {
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController exDate = TextEditingController();
  TextEditingController cvv = TextEditingController();
  bool isChecked = false;
  Color kPink = Color(0xFFEE4CBF);
  Color kRed = Color(0xFFFA3754);
  Color kBlue = Color(0xFF4AA3F2);
  Color kPurple = Color(0xFFAF92FB);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          statusBar(context),
          customMainAppBar(
              title: 'Payment Method',
              onTab: () {
                Navigator.pop(context);
              },
              icon: Icons.arrow_back_ios_rounded),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText(
                          title: 'Add Cards',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                        GestureDetector(
                          onTap: priceFilter,
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: AppData.primary,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(
                              Icons.add,
                              color: AppData.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {
                        return addCard();
                      },
                    ),
                    SizedBox(height: 10),
                    customButton(
                      title: 'PAY & CONTINUE',
                      margin: 6,
                      textColor: AppData.white,
                      radius: 25,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentProcessPage()));
                      },
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget addCard() {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: CreditCard(
            roundedCornerRadius: 10,
            cardBackground:
                SolidColorCardBackground(Colors.black.withOpacity(0.6)),
            cardNetworkType: CardNetworkType.visaBasic,
            cardHolderName: 'The boring developer',
            cardNumber: '1234 1234 1234 1234',
            company: CardCompany.yesBank,
            validity: Validity(
              validThruMonth: 1,
              validThruYear: 21,
              validFromMonth: 1,
              validFromYear: 16,
            ),
          ),
        ),
        Row(
          children: [
            Checkbox(
              splashRadius: 1.0,
              activeColor: AppData.black,
              value: isChecked,
              onChanged: (val) {
                setState(() {
                  isChecked = val;
                });
              },
            ),
            appText(
              title: 'Set as default payment method',
            )
          ],
        )
      ],
    );
  }

  void priceFilter() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Container(
            padding: EdgeInsets.fromLTRB(10, 20, 20, 15),
            decoration: BoxDecoration(
              color: AppData.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child:
                          Container(height: 3, width: 70, color: AppData.grey)),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.center,
                    child: appText(
                      title: 'Add Card',
                      color: AppData.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 15),
                  loginField(
                    controller: name,
                    keyboardType: TextInputType.name,
                    lable: 'Card Name',
                  ),
                  SizedBox(height: 10),
                  loginField(
                    controller: number,
                    keyboardType: TextInputType.number,
                    lable: 'Card Number',
                    inputFormate: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(16),
                      CardNumberInputFormatter()
                    ],
                  ),
                  SizedBox(height: 10),
                  loginField(
                    controller: exDate,
                    keyboardType: TextInputType.number,
                    lable: 'Expiry Date',
                    inputFormate: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                      CardMonthInputFormatter()
                    ],
                  ),
                  SizedBox(height: 10),
                  loginField(
                    controller: cvv,
                    keyboardType: TextInputType.number,
                    lable: 'CVV Number',
                    inputFormate: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Checkbox(
                        splashRadius: 1.0,
                        activeColor: AppData.black,
                        value: isChecked,
                        onChanged: (val) {
                          setState(() {
                            isChecked = val;
                          });
                        },
                      ),
                      appText(title: 'Set as default payment method')
                    ],
                  ),
                  SizedBox(height: 10),
                  customButton(
                    title: 'ADD CARD',
                    margin: 6,
                    textColor: AppData.white,
                    radius: 25,
                    onTap: () {
                      Navigator.pop(context);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => PaymentPage()));
                    },
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}

//!  Payment is Processing Page
class PaymentProcessPage extends StatefulWidget {
  @override
  _PaymentProcessPageState createState() => _PaymentProcessPageState();
}

class _PaymentProcessPageState extends State<PaymentProcessPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CompleteSimPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          spinkit,
          SizedBox(height: 15),
          appText(
            title: 'Please Wait',
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1,
          ),
          SizedBox(height: 8),
          appText(
            title: 'Payment is Processing',
            color: AppData.grey,
            letterSpacing: 0.5,
          )
        ],
      ),
    );
  }
}

const spinkit = SpinKitFadingCircle(
  duration: Duration(seconds: 2),
  color: AppData.primary,
  size: 100,
);
