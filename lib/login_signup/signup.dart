import 'package:airportcart/app_widget/Strings.dart';
import 'package:airportcart/app_widget/app_data.dart';
import 'package:airportcart/app_widget/widget.dart';
import 'package:airportcart/login_signup/login.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
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
                  title: 'Sign up',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 30),
                loginField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    lable: 'Name',
                    suffix: Icon(Icons.done, color: Colors.green)),
                SizedBox(height: 15),
                loginField(
                  controller: emailController,
                  lable: 'Email',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 15),
                loginField(
                  controller: phoneController,
                  lable: 'Phone Number',
                  keyboardType: TextInputType.phone,
                ),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        appText(
                          title: 'Already have an account?',
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
                SizedBox(height: 15),
                customButton(
                  width: MediaQuery.of(context).size.width,
                  title: 'SIGN UP',
                  radius: 50,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
                SizedBox(height: 30),
                Align(
                    alignment: Alignment.center,
                    child: appText(title: 'Or sign up with social account')),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    loginWith(
                      image: Strings.google,
                      onTap: () {},
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.08),
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
