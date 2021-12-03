import 'package:airportcart/Sim/s_payment_page.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:airportcart/app_widget/app_data.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:airportcart/Dining_Table/Table_Booking/Payment_Cancel_Policy.dart';
import 'package:image_picker/image_picker.dart';

class SimVerification extends StatefulWidget {
  @override
  _SimVerificationState createState() => _SimVerificationState();
}

class _SimVerificationState extends State<SimVerification> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController storeName = TextEditingController();
  TextEditingController planDetail = TextEditingController();
  TextEditingController totalCharge = TextEditingController();
  TextEditingController paymentMethod = TextEditingController();
  TextEditingController airportLocation = TextEditingController();
  TextEditingController idNumber = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController start = TextEditingController();
  // var pickedTime;
  // List categoryList = [];
  dynamic speciality;
  // var timeSelect;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          statusBar(context),
          customMainAppBar(
              title: 'Buy Sim Verification',
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
                      label: 'Email',
                      controller: email,
                      hintText: 'email0@gmail.com',
                      suffixIcon:
                          Icon(CupertinoIcons.envelope, color: AppData.black),
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
                      label: 'Sim Seller',
                      controller: storeName,
                      readOnly: true,
                      hintText: 'Store Name',
                      // keybord: TextInputType.number,
                      // suffixIcon: Icon(FeatherIcons.phone, color: AppData.black),
                    ),
                    walletTextField(
                      label: 'Sim Plan Details',
                      controller: planDetail,
                      readOnly: true,
                      hintText: 'Amount(\$)',
                      // keybord: TextInputType.number,
                      // suffixIcon: Icon(FeatherIcons.phone, color: AppData.black),
                    ),
                    walletTextField(
                      label: 'Date',
                      controller: date,
                      hintText: 'Date',
                      suffixIcon:
                          Icon(CupertinoIcons.calendar, color: AppData.black),
                      readOnly: true,
                      onTap: showDatePicker,
                    ),
                    walletTextField(
                      label: 'Total Charges',
                      controller: totalCharge,
                      hintText: 'Total Charges(\$)',
                      keybord: TextInputType.number,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text:
                                'Cancel up to 24 hours prior to your booking time to get a full refund.. ',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppData.grey,
                              letterSpacing: 0.8,
                              fontWeight: FontWeight.w500,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' Cancellation Policy',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppData.primary,
                                  letterSpacing: 0.8,
                                  fontWeight: FontWeight.w500,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              PaymentCancelPolicy()),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
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
                    walletTextField(
                      label: 'Select Your Birthday Date',
                      controller: dob,
                      hintText: 'Date Of Birth',
                      suffixIcon:
                          Icon(CupertinoIcons.calendar, color: AppData.black),
                      readOnly: true,
                      onTap: showDobPicker,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8, top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appText(
                            title: ' Select Your Id Proof',
                            fontSize: 15,
                            letterSpacing: 0.5,
                            color: AppData.black,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(height: 8),
                          sizeButton(),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    walletTextField(
                      label: 'Enter Proof Id Number',
                      controller: idNumber,
                      hintText: 'Id Number',
                      keybord: TextInputType.text,
                    ),
                    walletTextField(
                      label: 'Upload Your Photo',
                      // controller: number,
                      hintText: 'Select Image',
                      readOnly: true,
                      // keybord: TextInputType.number,
                      onTap: getFromGallery,
                      suffixIcon: Icon(Icons.cloud_upload_outlined,
                          color: AppData.black),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: RichText(
                        text: TextSpan(
                          text: 'Please upload Photo under ',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppData.greyDark,
                            // letterSpacing: 0.8,
                            // fontWeight: FontWeight.w500,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '30kb (jpeg, png format)',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppData.primary,
                                // letterSpacing: 0.8,
                                fontWeight: FontWeight.w500,
                              ),
                              // recognizer: TapGestureRecognizer()
                              //   ..onTap = () {
                              //     Navigator.push(
                              //       context,
                              //       CupertinoPageRoute(
                              //           builder: (context) =>
                              //               PaymentCancelPolicy()),
                              //     );
                              //   },
                            ),
                          ],
                        ),
                      ),
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
                                builder: (context) => SimPaymentPage()));
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

  void showDobPicker() {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      currentTime: DateTime.now(),
      minTime: DateTime(1970),
      maxTime: DateTime(2100),
      onConfirm: (selectDate) {
        setState(() {
          dob.text = DateFormat('yyyy-MM-dd').format(selectDate);
        });
      },
    );
  }

  void getFromGallery() async {
    final pickedFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    print('final' + pickedFile.toString());
    // if (pickedFile != null) {
    //   setState(() {
    //     // imageLoad = File(pickedFile.path);
    //     // imageFile = pickedFile.path.toString();
    //   });
    // }
  }

  Widget sizeButton() {
    return Padding(
      padding: EdgeInsets.only(right: 12, left: 0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
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
            hintText: 'Select Proof',
          ),
          value: speciality,
          onChanged: (value) {
            setState(() {
              speciality = value;
            });
          },
          items: <String>[
            'Passport',
            'Aadhaar Card',
            'Driving Licence',
          ].map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
          // items: categorylist
          //     .map(
          //       (categoryTitle) => DropdownMenuItem(
          //           value: categoryTitle['number'],
          //           child: Text("${categoryTitle['name']}")),
          //     )
          //     .toList(),
        ),
      ),
    );
  }
}
