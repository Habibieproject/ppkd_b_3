import 'package:flutter/material.dart';
import 'package:ppkd_b_3/day_15/home_b.dart';
import 'package:ppkd_b_3/day_15/textform.dart';
import 'package:ppkd_b_3/extension/navigation.dart';

class Day15ParsingData extends StatefulWidget {
  const Day15ParsingData({super.key});

  @override
  State<Day15ParsingData> createState() => _Day15ParsingDataState();
}

class _Day15ParsingDataState extends State<Day15ParsingData> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  @override
  //  controller: emailController,
  // onChanged: (value) {
  //   setState(() {});
  // },
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 12,
          children: [
            Row(children: [Text('Email')]),
            TextFormConst(
              hintText: "Masukkan Email",
              controller: emailController,
              onChanged: (p0) {
                setState(() {});
              },
            ),
            TextFormConst(
              hintText: "Masukkan Phone",
              controller: phoneController,
              onChanged: (p0) {
                setState(() {});
              },
            ),
            TextFormConst(
              hintText: "Masukkan Nama",
              controller: nameController,
              onChanged: (p0) {
                setState(() {});
              },
            ),

            Text(
              emailController.text,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              phoneController.text,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              nameController.text,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.push(
                    Day15HomeB(
                      email: emailController.text,
                      name: nameController.text,
                    ),
                  );
                },
                child: Text("Simpan"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
