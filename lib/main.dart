import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Data/app_constant_env.dart';
import 'package:sports_app/Screens/HomeScreen/home_screen.dart';
import 'package:sports_app/Screens/LoginScreen/login_screen.dart';
import 'package:sports_app/Screens/SignUpScreen/sign_up_screen.dart';
import 'package:sports_app/Screens/SplashScreen/splash_screen.dart';
import 'package:sports_app/Screens/WelcomeScreen/welcome_screen.dart';
import 'package:sports_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stock App',
      theme: appTheme,
      getPages: getPages,
      initialRoute: splashScreenPath,
    );
  }
}

List<GetPage<dynamic>>? getPages = [
  GetPage(
    name: welcomeScreenPath,
    page: () => const WelcomeScreen(),
  ),
  GetPage(
    name: splashScreenPath,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: loginScreenPath,
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: signUpScreenPath,
    page: () => const SignUpScreen(),
  ),
  GetPage(
    name: homeScreenPath,
    page: () => const HomeScreen(),
  ),
];
