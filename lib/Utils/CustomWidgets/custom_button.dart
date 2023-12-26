import 'package:flutter/material.dart';
import 'package:sports_app/Data/app_constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.color = kWelcomeGreyColor,
    this.onPressed,
    required this.shape,
    required this.text,
  });

  final Color color;
  final void Function()? onPressed;
  final LinearBorder shape;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: shape,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: kWhiteColor,
        ),
      ),
    );
  }
}
