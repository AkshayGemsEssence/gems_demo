import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gems_demo/dashboard.dart';
import 'package:gems_demo/forgot.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  //Akshat..fhv1213@
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.instagram,
                size: 40,
              ),
              TextFormField(
                controller: userNameController,
                validator: (String? text) {
                  if (text != null && text.isNotEmpty) {
                    if (text.contains("@")) {
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(text);
                      if (emailValid) {
                        return null;
                      } else {
                        return "Wrong email";
                      }
                    } else if (text.contains("_") || text.contains(".")) {
                      bool userNameValid = text.length > 6;
                      if (userNameValid) {
                        return null;
                      } else {
                        return "Wrong username";
                      }
                    } else if (RegExp(r"^[0-9]+$").hasMatch(text)) {
                      if (text.length == 10) {
                        return null;
                      } else {
                        return "Number should be 10";
                      }
                    }
                    print("RegExp:: ${RegExp(r"^[0-9]+$").hasMatch(text)}");
                    return "Something wrong";
                  }
                  return "Please provide Phone Number, UserName & Email";
                },
              ),
              TextFormField(
                controller: passwordController,
                validator: (String? text) {
                  if (text != null && text.isNotEmpty) {
                    bool passwordValid = text.length >= 6;
                    if (passwordValid) {
                      return null;
                    } else {
                      return "Please minimum 6 digit";
                    }
                  }
                  return "Please provide Password";
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => ForgotPage()));
                  },
                  child: Text("Forgot"),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {

                    final SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setString("userName", userNameController.text.trim());
                    prefs.setString("userPass", passwordController.text.trim());
                    prefs.setBool("isLogin", true);

                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => DashboardPage()));
                  }
                },
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
