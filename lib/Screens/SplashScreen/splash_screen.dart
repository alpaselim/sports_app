import 'package:flutter/material.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Data/app_constant_env.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Future.delayed ile 2 saniye bekleme süresi
    Future.delayed(const Duration(seconds: 2), () {
      // FirebaseAuth.instance.currentUser ile mevcut kullanıcıyı kontrol etme

      // Kullanıcı oturum açmışsa, ana ekrana yönlendir
      Navigator.pushNamedAndRemoveUntil(
        context,
        homeScreenPath,
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Image.asset(
        'assets/mackolik_splashScreen.jpeg',
      ),
    );
  }
}
