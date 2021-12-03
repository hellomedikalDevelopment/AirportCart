import 'package:airportcart/app_widget/widget.dart';
import 'package:airportcart/login_signup/notification.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  bool error = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          statusBar(context),
          SizedBox(height: 10),
          Expanded(
              child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Icon(Icons.arrow_back_ios_rounded),
                ),
                SizedBox(height: 20),
                appText(
                  title: 'Forgot Password',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 35),
                appText(
                  title:
                      'Please, enter your email address. You will receive a link to create a new password via email.',
                  fontSize: 14,
                  maxLines: 2,
                ),
                SizedBox(height: 30),
                loginField(
                    controller: emailController,
                    keyboardType: TextInputType.name,
                    lable: 'Email Address',
                    suffix: Icon(Icons.done, color: Colors.green)),
                SizedBox(height: 15),
                Visibility(
                    visible: error,
                    child: appText(
                      title:
                          'Not a valid email address. Should be your@email.com',
                      color: Colors.red,
                    )),
                SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                customButton(
                  width: MediaQuery.of(context).size.width,
                  title: 'SEND',
                  radius: 50,
                  onTap: () {
                    setState(() {
                      error = true;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationPage()));
                  },
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
