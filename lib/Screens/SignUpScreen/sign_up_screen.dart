import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Data/app_constant_env.dart';
import 'package:sports_app/Data/functions.dart';
import 'package:sports_app/Data/models/user_model.dart';
import 'package:sports_app/Services/auth_service.dart';
import 'package:sports_app/Services/firestore_service.dart';
import 'package:sports_app/Services/snackbar_service.dart';
import 'package:sports_app/Utils/CustomWidgets/custom_scaffold.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  // Password'ün görünürlüğünü kontrol eden değer
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
      "Üye Ol",
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                facebookSignUpButton(),
                const SizedBox(width: 20),
                googleSignInButton()
              ],
            ),
            const SizedBox(height: 20),
            titleTextField("Kullanıcı Adı", kBlackColor, 15),
            const SizedBox(height: 10),
            fullNameTextField(),
            const SizedBox(height: 10),
            titleTextField("E-Posta Adresi", kBlackColor, 15),
            const SizedBox(height: 10),
            emailTextField(),
            const SizedBox(height: 10),
            titleTextField("Şifre", kBlackColor, 15),
            const SizedBox(height: 10),
            passwordTextField(),
            const SizedBox(height: 20),
            signUpButton(),
            const SizedBox(height: 15),
            signInButton(),
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

  // Fullname'in alındığı TextFormField alanını oluşturur.
  TextFormField fullNameTextField() {
    return TextFormField(
      controller: fullnameController,
      textInputAction: TextInputAction.next,
      onEditingComplete: () {
        FocusScope.of(context).nextFocus();
      },
      validator: (value) {
        if (value == null || value.isEmpty || value.length < 2) {
          return "";
        } else {
          return null;
        }
      },
      style: const TextStyle(color: kBlackColor),
      decoration: const InputDecoration(
        hintText: "Kullanıcı Adı",
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
        hintText: "E-Posta Adresi",
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
        errorStyle: const TextStyle(height: 0),
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

  // Kullanıcı hesabının oluşturululmasını sağlayan TextButton'ı oluşturur.

  InkWell signUpButton() {
    return InkWell(
      onTap: () async {
        if (!formkey.currentState!.validate()) {
          snackbarService
              .showWarningSnackBar("Lütfen geçerli bilgileri girin.");
        } else {
          User? user = await authService.signUp(
              emailController.text, passwordController.text);
          if (user != null) {
            UserModel users = UserModel(
              name: fullnameController.text,
              email: emailController.text,
              password: passwordController.text,
              uid: user.uid,
              profilePicture: '',
            );
            await fireStoreService.addNewUser(users);
            // ignore: use_build_context_synchronously
            Navigator.pushNamed(
              context,
              homeScreenPath,
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
          child: Text("Üye Ol",
              style: TextStyle(
                  fontSize: 16,
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  // Kullanıcı eğer hesaba sahipse login ekranına yönlendiren TextButton alanını oluşturur.

  InkWell signInButton() {
    return InkWell(
      onTap: () => Navigator.pushNamedAndRemoveUntil(
        context,
        loginScreenPath,
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
          child: Text("Giriş Yap",
              style: TextStyle(
                  fontSize: 16,
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Expanded facebookSignUpButton() {
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/facebook.jpg",
                width: 35,
                height: 35,
              ),
              const SizedBox(width: 10),
              const Text(
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
        onTap: () => Navigator.pushNamedAndRemoveUntil(
          context,
          signUpScreenPath,
          (route) => false,
        ),
        child: Container(
          height: 60,
          decoration: const BoxDecoration(
            //borderRadius: BorderRadius.circular(28.5),
            color: kBlueColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/google.jpg",
                width: 35,
                height: 35,
              ),
              const SizedBox(width: 10),
              const Text(
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
