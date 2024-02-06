import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'splash.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
            bodyMedium: GoogleFonts.oswald(textStyle: textTheme.bodyMedium),
          ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: Colors.orange,
              width: 2
            )
          )
        )
      ),
      home: SplashPage(),
    );
  }
}
