import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Data/app_constant_env.dart';
import 'package:sports_app/Data/functions.dart';
import 'package:sports_app/Services/auth_service.dart';
import 'package:sports_app/Services/snackbar_service.dart';
import 'package:sports_app/Utils/CustomWidgets/custom_scaffold.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // TextFormField alanlarindan gelen değerler
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: appBarTitle(),
      body: body(),
    );
  }

  Widget appBarTitle() {
    return const Text(
      "Giriş Yap",
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Form(
        key: formkey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                facebookSignInButton(),
                const SizedBox(width: 20),
                googleSignInButton()
              ],
            ),
            const SizedBox(height: 20),
            titleTextField("E-Posta", kBlackColor, 15),
            const SizedBox(height: 10),
            emailTextField(),
            const SizedBox(height: 10),
            titleTextField("Şifre", kBlackColor, 15),
            const SizedBox(height: 10),
            passwordTextField(),
            const SizedBox(height: 20),
            signInButton(),
            const SizedBox(height: 15),
            signUpButton(),
            const SizedBox(height: 10),
            forgotPasswordButton(),
          ],
        ),
      ),
    );
  }

  // TextFormField alanlarının üstünde bulunan başlıkları oluşturmayı sağlar.
  Text titleTextField(String text, Color myColor, double fontSize) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: myColor,
      ),
    );
  }

  // Email'in alındığı TextFormField alanını oluşturur.
  TextFormField emailTextField() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onEditingComplete: () {
        FocusScope.of(context).nextFocus();
      },
      validator: (value) {
        if (value == null || value.isEmpty || functions.validateEmail(value)) {
          return "";
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
        hintText: "E-Posta",
      ),
    );
  }

  // Password'ün alındığı TextFormField alanını oluşturur.
  TextFormField passwordTextField() {
    return TextFormField(
      controller: passwordController,
      validator: (value) {
        if (value == null || value.isEmpty || value.length < 6) {
          return "";
        } else {
          return null;
        }
      },
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        hintText: 'Şifre',
        suffixIcon: IconButton(
          icon: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: kIconColor,
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
    );
  }

  // Bu fonksiyon unutulan şifreleri yenilenmesini sağlayan sayfaya yönlendirir.
  Center forgotPasswordButton() {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: const Text(
          "Şifremi Unuttum",
          style: TextStyle(
            color: kBlueColor,
            decoration: TextDecoration.underline,
            shadows: [
              Shadow(
                color: kShadowColor,
                offset: Offset(0, 4),
                blurRadius: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }

// Kullanıcının giriş yapmasını sağlayan TextButton'ı oluşturur.
  InkWell signInButton() {
    return InkWell(
      onTap: () async {
        if (!formkey.currentState!.validate()) {
          snackbarService
              .showWarningSnackBar("Lütfen geçerli bilgileri girin.");
        } else {
          User? user = await authService.signIn(
            emailController.text,
            passwordController.text,
          );
          if (user != null) {
            // ignore: use_build_context_synchronously
            Navigator.pushNamed(
              context,
              homeScreenPath,
            );
          } else {
            snackbarService.showWarningSnackBar(
              "Yanlış e-posta veya şifre.",
            );
          }
        }
      },
      child: Container(
        height: 45,
        width: 500,
        decoration: const BoxDecoration(
          //borderRadius: BorderRadius.circular(28.5),
          color: kBlueColor,
        ),
        child: const Center(
          child: Text("Giriş Yap",
              style: TextStyle(
                  fontSize: 16,
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  InkWell signUpButton() {
    return InkWell(
      onTap: () => Navigator.pushNamedAndRemoveUntil(
        context,
        signUpScreenPath,
        (route) => false,
      ),
      child: Container(
        height: 45,
        width: 500,
        decoration: const BoxDecoration(
          //borderRadius: BorderRadius.circular(28.5),
          color: kGreyColor,
        ),
        child: const Center(
          child: Text("Üye Ol",
              style: TextStyle(
                  fontSize: 16,
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Expanded facebookSignInButton() {
    return Expanded(
      child: InkWell(
        onTap: () => Navigator.pushNamedAndRemoveUntil(
          context,
          signUpScreenPath,
          (route) => false,
        ),
        child: Container(
          height: 60,
          decoration: const BoxDecoration(
            //borderRadius: BorderRadius.circular(28.5),
            color: kDarkblueColor,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.facebook_sharp),
              SizedBox(width: 5),
              Text(
                "Facebook ile\nbağlan",
                style: TextStyle(color: kWhiteColor),
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded googleSignInButton() {
    return Expanded(
      child: InkWell(
        onTap: () async {
          User? user = await authService.gSignIn();
          if (user != null) {
            // ignore: use_build_context_synchronously
            Navigator.pushNamed(
              context,
              homeScreenPath,
            );
          }
        },
        child: Container(
          height: 60,
          decoration: const BoxDecoration(
            //borderRadius: BorderRadius.circular(28.5),
            color: kBlueColor,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.facebook_outlined),
              SizedBox(width: 5),
              Text(
                "Google ile\nbağlan",
                style: TextStyle(color: kWhiteColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
