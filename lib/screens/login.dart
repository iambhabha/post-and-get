import 'dart:convert';

import 'package:api_call/screens/main_screen.dart';
import 'package:api_call/screens/reset_password.dart';
import 'package:api_call/screens/signup.dart';
import 'package:api_call/theme.dart';
import 'package:api_call/widgets/primary_button.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

final TextEditingController _loginemail = TextEditingController();
final TextEditingController _loginpassword = TextEditingController();

class LogInScreen extends StatefulWidget {
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: kDefaultPadding,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 120,
              ),
              Text(
                'Welcome Back',
                style: titleText,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    'New to this app?',
                    style: subTitle,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: textButton.copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness: 1,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: TextFormField(
                  controller: _loginemail,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: kTextFieldColor,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: TextFormField(
                  controller: _loginpassword,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: kTextFieldColor,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResetPasswordScreen()));
                },
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: kZambeziColor,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    decorationThickness: 1,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              PrimaryButton(
                buttonText: 'Log In',
                ontap: () {
                  postlogindata(context);
                  print("press");
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> postlogindata(context) async {
  try {
    if (_loginemail.text.isNotEmpty && _loginpassword.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse("http://192.168.29.169:80/matri/api/User/login"),
          body: ({
            "user_login": _loginemail.text,
            "user_password": _loginpassword.text,
          }));
      Map<String, dynamic> user = jsonDecode(response.body);
      if (response.statusCode == 200 && user['status'] == true) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const homepage()));
        _loginemail.text = '';
        _loginpassword.text = '';
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('invaild User')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('black field Not allowed')));
    }
  } catch (e) {
    print(e);
  }
}
