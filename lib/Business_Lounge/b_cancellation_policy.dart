import 'package:airportcart/app_widget/app_data.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:flutter/material.dart';

class BusinessCancellationPolicy extends StatefulWidget {
  @override
  _BusinessCancellationPolicyState createState() =>
      _BusinessCancellationPolicyState();
}

class _BusinessCancellationPolicyState
    extends State<BusinessCancellationPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appText(
                      title: 'Cancellation Policy',
                      color: AppData.primary,
                      fontSize: 16,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.bold),
                  IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              SizedBox(height: 10),
              policyRow(context,
                  title: '1.',
                  detail:
                      'Cancel up to 24 hours prior to your booking time to get a full refund.'),
              policyRow(context,
                  title: '2.',
                  detail:
                      'You may enter the lounge one hour before or after your booked time. Your booking starts upon entry.'),
              policyRow(context,
                  title: '3.',
                  detail:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
              policyRow(context,
                  title: '4.',
                  detail:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
            ],
          ),
        ),
      ),
    );
  }

  Widget policyRow(BuildContext context, {String title, String detail}) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appText(title: title, fontSize: 14, fontWeight: FontWeight.bold),
          SizedBox(width: 10),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: appText(
              title: detail,
              maxLines: 10,
              height: 1.25,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
