import 'package:flutter/material.dart';

const kWhiteColor = Colors.white;
const kSplashBackgroundColor = Color(0xFF34A853);
const kWelcomeGreyColor = Color.fromARGB(135, 253, 254, 255);
const titleTextFieldColor = Color(0xFF9796A1);
const kBlackColor = Colors.black;
const kBlueColor = Color.fromARGB(255, 55, 103, 178);
const kOrangeColor = Colors.orange;
const kOrangeLightColor = Color(0xffFE9F83);
const kGreenLightColor = Color(0xFFc0ff3e);
const kRedColor = Colors.red;
const kGreenColor = Color(0xFF35A854);
const kGreyColor = Color.fromARGB(255, 132, 141, 148);
const kShadowColor = Color.fromRGBO(0, 0, 0, 0.25);
const kButtonGreyColor = Color(0xFF5B5B5E);
const kIconColor = Color(0xFFD0D2D1);
const kLightGreyColor = Color.fromARGB(135, 253, 254, 255);
const kDarkGreenColor = Color.fromARGB(255, 79, 119, 145);
const kDarkblueColor = Color.fromARGB(255, 70, 98, 159);
const kLabelColor = Color.fromARGB(255, 65, 65, 65);
const kEventIconColor = Color.fromARGB(255, 118, 146, 151);
const kLineupBlue = Color.fromARGB(255, 1, 85, 185);
const kLineupGrey = Color.fromARGB(255, 66, 66, 66);
const kWhiteStickColor = Color.fromARGB(255, 218, 218, 218);
const kRedStickColor = Color.fromARGB(255, 212, 58, 58);
const kcustomWhiteColor = Color.fromARGB(255, 233, 232, 229);
const kcustomBlueColor = Color.fromARGB(255, 47, 130, 255);
const kTransparentColor = Colors.transparent;

ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: kWhiteColor,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: kWhiteColor, size: 30, // Geri buton rengi
    ),
    titleTextStyle: TextStyle(
      color: kWhiteColor, // Başlık rengi
      fontSize: 18, // Başlık font büyüklüğü
    ),
  ),
  useMaterial3: true,
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: const TextStyle(color: kGreyColor),
    contentPadding: const EdgeInsets.all(12.0),
    border: customOutlineInputBorder(),
    enabledBorder: customOutlineInputBorder(),
    focusedBorder: customOutlineInputBorder(),
    disabledBorder: customOutlineInputBorder(),
    errorBorder: customErrorOutlineInputBorder(),
    focusedErrorBorder: customErrorOutlineInputBorder(),
    //https://github.com/flutter/flutter/issues/99063
    errorStyle: const TextStyle(height: 0),
  ),
);

OutlineInputBorder customOutlineInputBorder() {
  return const OutlineInputBorder(
    //borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      color: kBlackColor,
      //width: 1.0,
    ),
  );
}

OutlineInputBorder customErrorOutlineInputBorder() {
  return const OutlineInputBorder(
    //borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      color: kBlackColor,
      //width: 1.0,
    ),
  );
}
