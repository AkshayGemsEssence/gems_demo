import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gems_demo/dashboard.dart';
import 'package:gems_demo/login.dart';
import 'package:gems_demo/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          FontAwesomeIcons.instagram,
          size: 30,
        ),
      ),
    );
  }

  @override
  void initState() {
    getSharedPreferenceData();
  }

  Future<void> getSharedPreferenceData() async {
    await Future.delayed(Duration(seconds: 1));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = prefs.getBool("isLogin") ?? false;
    if (isLogin) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const DashboardPage()));
    }else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const SignupPage()));
    }
  }
}
