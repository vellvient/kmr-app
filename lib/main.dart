import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kmrapp/screens/home_page.dart';
import 'package:kmrapp/screens/login.dart';
import 'package:kmrapp/screens/onboarding_screen.dart';
import 'package:kmrapp/screens/root.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KMR APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorSchemeSeed: Colors.deepPurple,
          useMaterial3: true,
          textTheme: GoogleFonts.plusJakartaSansTextTheme(
              Theme.of(context).textTheme)),
      home: OnboardingScreen(),
      // home: RootPage(),
    );
  }
}
