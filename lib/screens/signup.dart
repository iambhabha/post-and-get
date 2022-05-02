import 'package:api_call/screens/login.dart';
import 'package:api_call/theme.dart';
import 'package:api_call/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _mobile = TextEditingController();
  final TextEditingController _password = TextEditingController();

  postdata() async {
    var response = await http.post(
        Uri.parse("http://192.168.29.169:80/matri/api/User/register"),
        body: {
          "user_rname": _name.text.trim(),
          "user_mobile": _mobile.text.trim(),
          "user_password": _password.text.trim(),
          "user_email": _email.text.trim(),
        });
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              'Create Account',
              style: titleText,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: kDefaultPadding,
            child: Row(
              children: [
                Text(
                  'Already a member?',
                  style: subTitle,
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LogInScreen()));
                  },
                  child: Text(
                    'Log In',
                    style: textButton.copyWith(
                      decoration: TextDecoration.underline,
                      decorationThickness: 1,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      controller: _name,
                      decoration: const InputDecoration(
                        hintText: 'Full Name',
                        hintStyle: TextStyle(color: kTextFieldColor),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kPrimaryColor)),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      controller: _email,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(color: kTextFieldColor),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kPrimaryColor)),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      controller: _mobile,
                      decoration: const InputDecoration(
                        hintText: 'number',
                        hintStyle: TextStyle(color: kTextFieldColor),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kPrimaryColor)),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      controller: _password,
                      decoration: const InputDecoration(
                        hintText: 'password',
                        hintStyle: TextStyle(color: kTextFieldColor),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kPrimaryColor)),
                      ),
                    )),
              ],
            ),
          ),
          PrimaryButton(
              buttonText: "login",
              ontap: () {
                Navigator.pop(context);
                postdata();
              }),
        ],
      ),
    );
  }
}
