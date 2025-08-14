import 'package:flutter/material.dart';
import 'package:ppkd_b_3/day_10/login_screen.dart';
import 'package:ppkd_b_3/day_12/main_screen.dart';
import 'package:ppkd_b_3/day_16/preference/shared_preference.dart';
import 'package:ppkd_b_3/day_16/utils/app_image.dart';
import 'package:ppkd_b_3/extension/navigation.dart';

class Day16SplashScreen extends StatefulWidget {
  const Day16SplashScreen({super.key});
  static const id = "/splash_screen";

  @override
  State<Day16SplashScreen> createState() => _Day16SplashScreenState();
}

class _Day16SplashScreenState extends State<Day16SplashScreen> {
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    bool? isLogin = await PreferenceHandler.getLogin();

    Future.delayed(Duration(seconds: 3)).then((value) async {
      print(isLogin);
      if (isLogin == true) {
        context.pushReplacementNamed(MainScreen.id);
      } else {
        context.push(LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImage.iconGoogle),
            SizedBox(height: 20),
            Text("Welcome"),
          ],
        ),
      ),
    );
  }
}
