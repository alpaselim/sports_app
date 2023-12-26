import 'package:flutter/material.dart';
import 'package:sports_app/Data/app_constant.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final Widget appBarTitle;

  const CustomScaffold({
    Key? key,
    required this.body,
    required this.appBarTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kBlueColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            appBarTitle,
          ],
        ),
      ),
      body: SafeArea(
        top: false,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Expanded(child: body),
            ],
          ),
        ),
      ),
    );
  }
}
