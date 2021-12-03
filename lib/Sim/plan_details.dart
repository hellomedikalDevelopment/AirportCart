import 'package:airportcart/Sim/sim_verification.dart';
import 'package:airportcart/app_widget/Strings.dart';
import 'package:airportcart/app_widget/app_data.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ticket_widget/flutter_ticket_widget.dart';

class PlanDetails extends StatefulWidget {
  @override
  _PlanDetailsState createState() => _PlanDetailsState();
}

class _PlanDetailsState extends State<PlanDetails> {
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
                              title: 'Your Booking Details',
                              fontSize: 18,
                              letterSpacing: 0.5,
                              color: AppData.white),
                          SizedBox(height: 15),
                          Container(
                            // height: MediaQuery.of(context).size.height * 0.6,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            child: _getTicketReceiptView(),
                          ),
                          customButton(
                            title: 'Book Now',
                            margin: 20,
                            color: AppData.white,
                            textColor: AppData.greyDark,
                            radius: 8,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SimVerification()));
                            },
                          ),
                          SizedBox(height: 15),
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
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getTicketReceiptView() {
    return Container(
      child: FlutterTicketWidget(
        width: MediaQuery.of(context).size.width * 1,
        height: 352,
        isCornerRounded: true,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              appText(
                  title: 'Vodafone Store',
                  fontSize: 14,
                  letterSpacing: 0.5,
                  color: AppData.primary),
              Divider(height: 25),
              Container(
                alignment: Alignment.bottomLeft,
                child: appText(
                    title: '15 GB DATA',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    color: AppData.black),
              ),
              infoDetails(context,
                  icon: Icons.done_rounded,
                  width: MediaQuery.of(context).size.width * 0.66,
                  color: AppData.green,
                  size: 20,
                  detail: 'Unlimited Incoming Calls'),
              infoDetails(context,
                  icon: Icons.done_rounded,
                  width: MediaQuery.of(context).size.width * 0.66,
                  color: AppData.green,
                  size: 20,
                  detail: 'Unlimited Local Calls & SMS'),
              infoDetails(context,
                  icon: Icons.done_rounded,
                  width: MediaQuery.of(context).size.width * 0.66,
                  color: AppData.green,
                  size: 20,
                  detail: '30 days validity'),
              infoDetails(context,
                  icon: Icons.done_rounded,
                  width: MediaQuery.of(context).size.width * 0.66,
                  color: AppData.green,
                  size: 20,
                  detail: 'Student Visa Mandatory'),
              infoDetails(context,
                  icon: Icons.done_rounded,
                  width: MediaQuery.of(context).size.width * 0.66,
                  color: AppData.green,
                  size: 20,
                  detail: '500 Minutes Calls to India'),
              Divider(height: 25),
              appText(
                  title: 'Afrikanns Prepaid SIM',
                  fontSize: 14,
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
