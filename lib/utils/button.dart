import 'package:flutter/material.dart';
import 'package:ppkd_b_3/constant/app_color.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    this.onPressed,
    required this.text,
    this.color,
  });
  final void Function()? onPressed;
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColor.blueButton,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
