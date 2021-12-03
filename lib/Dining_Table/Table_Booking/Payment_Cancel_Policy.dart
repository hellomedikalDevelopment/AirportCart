import 'package:airportcart/app_widget/app_data.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:flutter/material.dart';

class PaymentCancelPolicy extends StatefulWidget {
  @override
  _PaymentCancelPolicyState createState() => _PaymentCancelPolicyState();
}

class _PaymentCancelPolicyState extends State<PaymentCancelPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appText(
                    title: 'Payment Cancel Policy ',
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appText(
                  title: '1. ',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: appText(
                    title:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                    maxLines: 10,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appText(
                  title: '2. ',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: appText(
                    title:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                    maxLines: 10,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appText(
                  title: '3. ',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: appText(
                    title:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                    maxLines: 10,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appText(
                  title: '4. ',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: appText(
                    title:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                    maxLines: 10,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appText(
                  title: '5. ',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: appText(
                    title:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                    maxLines: 10,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
