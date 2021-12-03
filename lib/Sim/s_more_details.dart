import 'package:airportcart/My_Order/show_barcode.dart';
import 'package:airportcart/app_widget/Strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ticket_widget/flutter_ticket_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../app_widget/app_data.dart';
import '../app_widget/widget.dart';

class SimMoreDetails extends StatefulWidget {
  final String value;
  SimMoreDetails({this.value});
  @override
  _SimMoreDetailsState createState() => _SimMoreDetailsState();
}

class _SimMoreDetailsState extends State<SimMoreDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppData.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          statusBar(context),
          customMainAppBar(
              title: '',
              icon: Icons.close_rounded,
              onTab: () {
                Navigator.pop(context);
              },
              onPressed: () {
                // sizeFilter();
              },
              trailing: Icons.cloud_upload_outlined),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                // height: MediaQuery.of(context).size.height * 0.85,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      // padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(Strings.vodafone_logo, height: 75),
                          SizedBox(height: 10),
                          appText(
                              title: 'Hello Varun!',
                              fontSize: 18,
                              letterSpacing: 0.5,
                              color: AppData.white),
                          SizedBox(height: 5),
                          appText(
                              title: 'See Plan Details',
                              fontSize: 18,
                              letterSpacing: 0.5,
                              color: AppData.white),
                          SizedBox(height: 15),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: appText(
                                title:
                                    'We’ve sent you the details copy on your email.',
                                fontSize: 12,
                                height: 1.5,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                letterSpacing: 0.5,
                                color: AppData.white),
                          ),
                          SizedBox(height: 15),
                          Container(
                            // height: MediaQuery.of(context).size.height * 0.6,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            child: _getTicketReceiptView(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.location_on_outlined,
                                  color: AppData.white),
                              SizedBox(width: 5),
                              appText(
                                  title: 'India,New Delhi Airport - T2',
                                  fontSize: 12,
                                  letterSpacing: 0.5,
                                  color: AppData.white),
                            ],
                          ),
                          SizedBox(height: 10),
                          // Container(
                          //   child: _getTicketReceiptView(),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // SizedBox(height: 150),
        ],
      ),
    );
  }

  Widget _getTicketReceiptView() {
    return Container(
      // height: MediaQuery.of(context).size.height *0.5,
      child: FlutterTicketWidget(
        width: MediaQuery.of(context).size.width * 1,
        // height: MediaQuery.of(context).size.height * 0.6,
        height: 395,
        isCornerRounded: true,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              appText(
                  title: 'Afrikanns Prepaid SIM',
                  fontSize: 16,
                  letterSpacing: 0.5,
                  color: AppData.primary),
              Divider(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appText(
                          title: 'BOOKING DATE',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppData.greyLight),
                      SizedBox(height: 5),
                      appText(
                          title: '29 MAY 2021',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppData.black),
                    ],
                  ),
                  Column(
                    children: [
                      appText(
                          title: 'BOOKING TIME',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppData.greyLight),
                      SizedBox(height: 5),
                      appText(
                          title: '13:05 PM',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppData.black),
                    ],
                  ),
                ],
              ),
              Divider(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      appText(
                          title: 'TOTAL ITEMS',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppData.greyLight),
                      SizedBox(height: 5),
                      appText(
                          title: '1',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppData.black),
                    ],
                  ),
                  Column(
                    children: [
                      appText(
                          title: 'TOTAL AMOUNT',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppData.greyLight),
                      SizedBox(height: 5),
                      appText(
                          title: '\$30.00',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppData.green),
                    ],
                  ),
                ],
              ),
              Divider(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appText(
                      title: 'VERIFY DOCUMENT',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppData.greyLight),
                  appText(
                      title: widget.value == 'submit'
                          ? 'COMPLETE'
                          : widget.value == 'pending'
                              ? 'PROCESSING'
                              : 'CANCELLED',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: widget.value == 'submit'
                          ? AppData.green
                          : widget.value == 'pending'
                              ? AppData.yellow
                              : AppData.red),
                ],
              ),
              Divider(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      appText(
                          title: 'COUNTRY',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppData.greyLight),
                      SizedBox(height: 5),
                      appText(
                          title: 'BIRMINGHAM',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppData.black),
                    ],
                  ),
                  Column(
                    children: [
                      appText(
                          title: 'PLAN PRICE',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppData.greyLight),
                      SizedBox(height: 5),
                      appText(
                          title: '\$30.00',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppData.black),
                    ],
                  ),
                ],
              ),
              Divider(height: 25),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: appText(
                    title: 'Scan this bar code and show order details',
                    fontSize: 16,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    letterSpacing: 0.5,
                    color: AppData.primary),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      appText(
                          title: 'ORDER NUMBER',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppData.greyLight),
                      SizedBox(height: 5),
                      appText(
                          title: '01672721252926',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppData.black),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShowBarCode()));
                    },
                    child: QrImage(
                      data: '01672721252926',
                      version: QrVersions.auto,
                      size: 60.0,
                      foregroundColor: AppData.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ticketDetailsWidget(String firstTitle, String firstDesc,
      String secondTitle, String secondDesc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                firstTitle,
                style: TextStyle(
                  color: AppData.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  firstDesc,
                  style: TextStyle(
                    color: AppData.black,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                secondTitle,
                style: TextStyle(
                  color: AppData.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  secondDesc,
                  style: TextStyle(
                    color: AppData.black,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
