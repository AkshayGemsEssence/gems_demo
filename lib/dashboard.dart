import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String userName = "";
  String userPass = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Dashboard"),
            Text("userName: ${userName}"),
            Text("userPass: ${userPass}"),
            TextButton(
              onPressed: () async {
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.clear();
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (_) => const LoginPage()));
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    getSharedPreferenceData();
  }

  Future<void> getSharedPreferenceData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = prefs.getString("userName") ?? "Not Logged In";
    userPass = prefs.getString("userPass") ?? "Not Logged In";
    setState(() {});
  }
}
