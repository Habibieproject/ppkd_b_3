import 'package:flutter/material.dart';
import 'package:ppkd_b_3/day_10/login_screen.dart';
import 'package:ppkd_b_3/day_16/preference/shared_preference.dart';
import 'package:ppkd_b_3/extension/navigation.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        PreferenceHandler.removeLogin();
        context.pushReplacementNamed(LoginScreen.id);
      },
      child: Text("Keluar"),
    );
  }
}
