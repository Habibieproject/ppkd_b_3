import 'package:flutter/material.dart';

class NavPop extends StatelessWidget {
  const NavPop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page2');
              },
              child: const Text('Go to page2 NavPop'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page3');
              },
              child: const Text('Go to page3 NavPop'),
            ),
          ],
        ),
      ),
    );
  }
}

class NavPop2 extends StatelessWidget {
  const NavPop2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 2')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back page1'),
        ),
      ),
    );
  }
}

class NavPop3 extends StatelessWidget {
  const NavPop3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 3')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back page1'),
        ),
      ),
    );
  }
}
