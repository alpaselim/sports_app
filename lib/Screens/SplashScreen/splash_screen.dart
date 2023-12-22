import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        // Navigator ile Welcome Screen'a geçiş
        Navigator.pushNamedAndRemoveUntil(
          context,
          welcomeScreenPath,
          (route) => false,
        );
      } else {
        // Kullanıcı oturum açmışsa, ana ekrana yönlendir
        Navigator.pushNamedAndRemoveUntil(
          context,
          homeScreenPath,
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSplashBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Agri_Grow_Logo.png', width: 200, height: 200),
            const SizedBox(height: 10),
            Image.asset('assets/AgriGrow.png', width: 166, height: 41),
            const SizedBox(height: 10),
            const Text(
              'Farmer Friendly App',
              style: TextStyle(color: kWhiteColor, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
