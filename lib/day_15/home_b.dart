import 'package:flutter/material.dart';

class Day15HomeB extends StatelessWidget {
  const Day15HomeB({
    super.key,
    required this.email,
    this.phone,
    required this.name,
  });
  final String email;
  final String? phone;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            email,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            phone ?? "Tidak ada nomor telepon",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
