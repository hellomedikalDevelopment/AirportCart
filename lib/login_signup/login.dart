import 'package:airportcart/My_Home_Page.dart';
import 'package:airportcart/app_widget/Strings.dart';
import 'package:airportcart/app_widget/app_data.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:airportcart/login_signup/forgot_password.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          statusBar(context),
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
                  title: 'Login',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 30),
                loginField(
                    controller: emailController,
                    keyboardType: TextInputType.name,
                    lable: 'Email Address',
                    suffix: Icon(Icons.done, color: Colors.green)),
                SizedBox(height: 15),
                loginField(
                  controller: passController,
                  lable: 'Password',
                  keyboardType: TextInputType.emailAddress,
                  isPassword: !passwordVisible,
                  suffix: GestureDetector(
                    onTap: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                    child: Icon(
                      passwordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassword()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        appText(
                          title: 'Forgot Your Password',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_right_alt_rounded,
                            color: AppData.primary)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 35),
                customButton(
                  width: MediaQuery.of(context).size.width,
                  title: 'LOGIN',
                  radius: 50,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.20),
                Align(
                    alignment: Alignment.center,
                    child: appText(title: 'Or sign up with social account')),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    loginWith(
                      image: Strings.google,
                      onTap: () {},
                    ),
                    loginWith(
                      image: Strings.facebook,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
