import 'package:flutter/material.dart';

class PushAndRemUn extends StatelessWidget {
  const PushAndRemUn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const PageA()),
              (Route<dynamic> route) => false,
            );
          },
          child: const Text('Login & Masuk ke Home'),
        ),
      ),
    );
  }
}

// =======================
// Halaman A
// =======================
class PageA extends StatelessWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman A')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PageB()),
            );
          },
          child: const Text('Ke Halaman B'),
        ),
      ),
    );
  }
}

// =======================
// Halaman B
// =======================
class PageB extends StatelessWidget {
  const PageB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman B')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Ganti Halaman B dengan Halaman C (B hilang, A masih ada)
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const PageC()),
                );
              },
              child: const Text('Ke Halaman C (pushReplacement)'),
            ),
          ),
        ],
      ),
    );
  }
}

// =======================
// Halaman C
// =======================
class PageC extends StatelessWidget {
  const PageC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman C')),
      body: Column(
        children: [
          const Center(
            child: Text(
              'Ini Halaman C\nCoba tekan tombol Back',
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Kembali'),
          ),
        ],
      ),
    );
  }
}
