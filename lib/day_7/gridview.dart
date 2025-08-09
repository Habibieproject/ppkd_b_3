import 'package:flutter/material.dart';

class Day7GridView extends StatelessWidget {
  const Day7GridView({super.key});
  static const id = "/day7grid";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Day 7 Grid View")),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 48,
                  width: 48,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.red),
                  child: Text("Postingan"),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Container(
                  height: 48,
                  width: 48,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.yellow),
                  child: Text("Follower"),
                ),
              ),
            ],
          ),
          GridView.count(
            shrinkWrap: true,
            padding: EdgeInsets.all(8.0),
            crossAxisCount: 3,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: [
              Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(color: Colors.red),
              ),
              Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(color: Colors.yellow),
              ),
              Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(color: Colors.red),
              ),
              Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(color: Colors.green),
              ),
              Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(color: Colors.blue),
              ),
              Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(color: Colors.tealAccent),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
