import 'dart:async';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui/welcomescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 6),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => welcomescreen(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        'images/whatsapp_image.jpg',
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
