import 'package:flutter/material.dart';
import 'package:ppkd_b_3/day_15/textform.dart';
import 'package:ppkd_b_3/day_16/model/user.dart';
import 'package:ppkd_b_3/day_16/sqflite/db_helper.dart';

class Day16UserScreen extends StatefulWidget {
  const Day16UserScreen({super.key});

  @override
  State<Day16UserScreen> createState() => _Day16UserScreenState();
}

class _Day16UserScreenState extends State<Day16UserScreen> {
  List<User> users = [];
  @override
  void initState() {
    super.initState();
    getUser();
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> getUser() async {
    final dataUser = await DbHelper.getAllUsers();
    print(dataUser);
    setState(() {
      users = dataUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormConst(hintText: "Nama", controller: nameController),
            TextFormConst(hintText: "Email", controller: emailController),
            TextFormConst(hintText: "Password", controller: passwordController),
            ElevatedButton(
              onPressed: () async {
                final email = emailController.text.trim();
                final password = passwordController.text.trim();
                final name = nameController.text.trim();
                if (email.isEmpty || password.isEmpty || name.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Email, Password, dan Nama tidak boleh kosong",
                      ),
                    ),
                  );

                  return;
                }
                final user = User(email: email, password: password, name: name);
                await DbHelper.registerUser(user);
                Future.delayed(const Duration(seconds: 1)).then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Pendaftaran berhasil")),
                  );
                });
                getUser();
                setState(() {});
              },
              child: Text("Simpan Data"),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                final dataUserLogin = users[index];
                return ListTile(
                  title: Text(dataUserLogin.name),
                  subtitle: Text(dataUserLogin.email),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
