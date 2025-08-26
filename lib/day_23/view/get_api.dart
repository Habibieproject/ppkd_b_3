import 'package:flutter/material.dart';
import 'package:ppkd_b_3/day_23/api/get_user.dart';
import 'package:ppkd_b_3/day_23/model/user_model.dart';

class Day23GetAPIScreen extends StatefulWidget {
  const Day23GetAPIScreen({super.key});
  static const id = "/get_api_screen";

  @override
  State<Day23GetAPIScreen> createState() => _Day23GetAPIScreenState();
}

class _Day23GetAPIScreenState extends State<Day23GetAPIScreen> {
  @override
  // void initState() {
  //   super.initState();
  //   getUser();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<List<UserModel>>(
              future: getUser(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  final users = snapshot.data as List<UserModel>;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: users.length,
                    itemBuilder: (BuildContext context, int index) {
                      final dataUser = users[index];
                      return ListTile(
                        leading: Image.network(dataUser.avatar ?? ""),
                        title: Text(dataUser.email ?? ""),
                        subtitle: Text(
                          "${dataUser.firstName} ${dataUser.lastName}" ?? "",
                        ),
                      );
                    },
                  );
                } else {
                  return Text("Gagal Memuat data");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
