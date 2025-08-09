import 'package:flutter/material.dart';

class Navpush extends StatelessWidget {
  const Navpush({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Navpush2()),
            );
          },
          child: const Text('Go to page2'),
        ),
      ),
    );
  }
}

class Navpush2 extends StatelessWidget {
  const Navpush2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {}, child: const Text('Go back')),
      ),
    );
  }
}
