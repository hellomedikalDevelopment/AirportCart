import 'package:airportcart/Shopping_Experience/shopping_payment_page.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import '../app_widget/app_data.dart';
import '../app_widget/widget.dart';

class ShippingOrderDetails extends StatefulWidget {
  @override
  _ShippingOrderDetailsState createState() => _ShippingOrderDetailsState();
}

class _ShippingOrderDetailsState extends State<ShippingOrderDetails> {
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController paymentMethod = TextEditingController();
  TextEditingController airportLocation = TextEditingController();
  TextEditingController totalPayment = TextEditingController();
  TextEditingController date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          statusBar(context),
          customMainAppBar(
              title: 'Order Details',
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
                    SizedBox(height: 25),
                    walletTextField(
                      label: 'Your Name',
                      controller: name,
                      hintText: 'Name',
                      suffixIcon: Icon(FeatherIcons.user, color: AppData.black),
                    ),
                    walletTextField(
                      label: 'Phone Number',
                      controller: number,
                      hintText: 'Phone Number',
                      keybord: TextInputType.number,
                      suffixIcon:
                          Icon(FeatherIcons.phone, color: AppData.black),
                    ),
                    walletTextField(
                        label: 'Select Delivery Date',
                        controller: date,
                        hintText: 'Date',
                        suffixIcon:
                            Icon(CupertinoIcons.calendar, color: AppData.black),
                        readOnly: true,
                        onTap: showDatePicker),
                    walletTextField(
                        label: 'Total Payment',
                        controller: totalPayment,
                        hintText: 'Total Amount(\$)',
                        keybord: TextInputType.number),
                    walletTextField(
                      label: 'Payment Method',
                      controller: paymentMethod,
                      hintText: 'Payment Method',
                      suffixIcon:
                          Icon(Icons.arrow_forward_ios, color: AppData.black),
                    ),
                    walletTextField(
                      label: 'Airport Location',
                      controller: airportLocation,
                      hintText: 'Airport Location',
                      suffixIcon: Icon(Icons.location_searching_sharp,
                          color: AppData.black),
                    ),
                    SizedBox(height: 30),
                    customButton(
                      title: 'CONTINUE',
                      margin: 6,
                      textColor: AppData.white,
                      radius: 25,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShoppingPaymentPage()));
                      },
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void showDatePicker() {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      currentTime: DateTime.now(),
      minTime: DateTime(1970),
      maxTime: DateTime(2100),
      onConfirm: (selectDate) {
        setState(() {
          date.text = DateFormat('yyyy-MM-dd').format(selectDate);
        });
      },
    );
  }
}
