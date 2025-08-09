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
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Hapus semua halaman sebelumnya (A & B hilang)
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const PageC()),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text('Ke Halaman C (pushAndRemoveUntil)'),
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
