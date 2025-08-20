import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ppkd_b_3/constant/app_color.dart';
import 'package:ppkd_b_3/utils/button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RandomPickerScreen extends StatefulWidget {
  const RandomPickerScreen({super.key});

  @override
  State<RandomPickerScreen> createState() => _RandomPickerScreenState();
}

class _RandomPickerScreenState extends State<RandomPickerScreen> {
  List<String> allNames = [];
  List<String> availableNames = [];
  List<String> eliminatedNames = [];
  String selectedName = "Tekan tombol untuk memilih";
  bool isPicking = false;
  final Random random = Random();
  Timer? _timer;
  late ConfettiController confettiController;

  @override
  void initState() {
    super.initState();
    confettiController = ConfettiController(
      duration: const Duration(seconds: 5),
    );
    _initState();
  }

  Future<void> _initState() async {
    await _loadNamesFromAssets();
    await _loadSavedState();
  }

  Future<void> _loadNamesFromAssets() async {
    final String jsonString = await rootBundle.loadString('assets/names.json');
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    allNames = List<String>.from(jsonData["names"]);
    // Jika tidak ada data yang disimpan, gunakan ini sebagai fallback awal
    if (availableNames.isEmpty && eliminatedNames.isEmpty) {
      setState(() {
        availableNames = List<String>.from(allNames);
      });
    }
  }

  Future<void> _loadSavedState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedName =
          prefs.getString('selectedName') ?? "Tekan tombol untuk memilih";
      availableNames =
          prefs.getStringList('availableNames') ?? List<String>.from(allNames);
      eliminatedNames = prefs.getStringList('eliminatedNames') ?? [];
    });
  }

  Future<void> _saveState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedName', selectedName);
    await prefs.setStringList('availableNames', availableNames);
    await prefs.setStringList('eliminatedNames', eliminatedNames);
  }

  void pickRandomName() {
    if (availableNames.isEmpty || isPicking) return;

    setState(() {
      isPicking = true;
    });

    int count = 0;
    const int totalCycles = 20;
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        selectedName = availableNames[random.nextInt(availableNames.length)];
      });

      count++;
      if (count >= totalCycles) {
        timer.cancel();
        confettiController.play();
        _finalizePick();
      }
    });
  }

  void _finalizePick() {
    if (availableNames.isEmpty) return;

    setState(() {
      selectedName = availableNames.removeAt(
        random.nextInt(availableNames.length),
      );
      eliminatedNames.insert(0, selectedName);
      isPicking = false;
    });
    _saveState();
  }

  void resetPicker() {
    setState(() {
      availableNames = List<String>.from(allNames);
      eliminatedNames.clear();
      selectedName = "Tekan tombol untuk memilih";
    });
    _saveState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          "Random Picker",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColor.secondaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 250,
              child: Card(
                color: AppColor.secondaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: Text(
                            selectedName,
                            key: ValueKey(selectedName),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: DefaultButton(
                color: AppColor.primaryColor,
                text: availableNames.isEmpty
                    ? "Semua nama sudah dipilih"
                    : isPicking
                    ? "Memilih..."
                    : "Pilih Nama",
                onPressed: isPicking || availableNames.isEmpty
                    ? null
                    : pickRandomName,
              ),
            ),
            ConfettiWidget(
              confettiController: confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: [
                AppColor.redColor,
                Colors.blue,
                AppColor.secondaryColor,
                AppColor.primaryColor,
              ],
            ),
            const SizedBox(height: 10),
            if (eliminatedNames.isNotEmpty)
              DefaultButton(
                color: AppColor.redColor,
                text: "Reset",
                onPressed: resetPicker,
              ),
            const SizedBox(height: 20),
            Expanded(
              child: eliminatedNames.isEmpty
                  ? Container()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Nama yang sudah dipilih:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: eliminatedNames.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: CircleAvatar(
                                  backgroundColor: AppColor.secondaryColor,
                                  child: Text(
                                    "${eliminatedNames.length - index}",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                                title: Text(eliminatedNames[index]),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
