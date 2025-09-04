import 'package:flutter/material.dart';
import 'package:ppkd_b_3/day_12/main_screen.dart';
import 'package:ppkd_b_3/day_25/api/register_user.dart';
import 'package:ppkd_b_3/day_25/view/post_api_screen.dart';
import 'package:ppkd_b_3/extension/navigation.dart';
import 'package:ppkd_b_3/preference/shared_preference.dart';

class LoginAPIScreen extends StatefulWidget {
  const LoginAPIScreen({super.key});
  static const id = "/login_api";
  @override
  State<LoginAPIScreen> createState() => _LoginAPIScreenState();
}

class _LoginAPIScreenState extends State<LoginAPIScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isVisibility = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: [buildBackground(), buildLayer()]));
  }

  login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email dan Password tidak boleh kosong")),
      );
      // isLoading = false;

      return;
    }
    final userData = await AuthenticationAPI.loginUser(
      email: email,
      password: password,
    );
    if (userData.data != null) {
      PreferenceHandler.saveLogin();
      PreferenceHandler.saveToken("Bearer ${userData.data?.token}");
      context.pushReplacementNamed(MainScreen.id);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(userData.message ?? "Login gagal")),
      );
    }
  }

  SafeArea buildLayer() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome Back",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              height(12),
              Text(
                "Login API to access your account",
                // style: TextStyle(fontSize: 14, color: AppColor.gray88),
              ),
              height(24),
              buildTitle("Email Address"),
              height(12),
              buildTextField(
                hintText: "Enter your email",
                controller: emailController,
              ),

              height(16),
              buildTitle("Password"),
              height(12),
              buildTextField(
                hintText: "Enter your password",
                isPassword: true,
                controller: passwordController,
              ),
              height(12),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => MeetSebelas()),
                    // );
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 12,
                      // color: AppColor.orange,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              height(24),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    login();
                  },
                  style: ElevatedButton.styleFrom(
                    // backgroundColor: AppColor.blueButton,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              height(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 8),
                      height: 1,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Or Sign In With",
                    // style: TextStyle(fontSize: 12, color: AppColor.gray88),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 8),

                      height: 1,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              height(16),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    // Navigate to MeetLima screen menggunakan pushnamed
                    Navigator.pushNamed(context, "/meet_2");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/icon_google.png",
                        height: 16,
                        width: 16,
                      ),
                      width(4),
                      Text("Google"),
                    ],
                  ),
                ),
              ),
              height(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    // style: TextStyle(fontSize: 12, color: AppColor.gray88),
                  ),
                  TextButton(
                    onPressed: () {
                      context.push(PostApiScreen());
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => MeetEmpatA()),
                      // );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        // color: AppColor.blueButton,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  TextField buildTextField({
    String? hintText,
    bool isPassword = false,
    TextEditingController? controller,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword ? isVisibility : false,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isVisibility = !isVisibility;
                  });
                },
                icon: Icon(
                  isVisibility ? Icons.visibility_off : Icons.visibility,
                  // color: AppColor.gray88,
                ),
              )
            : null,
      ),
    );
  }

  SizedBox height(double height) => SizedBox(height: height);
  SizedBox width(double width) => SizedBox(width: width);

  Widget buildTitle(String text) {
    return Row(
      children: [
        // Text(text, style: TextStyle(fontSize: 12, color: AppColor.gray88)),
      ],
    );
  }
}
