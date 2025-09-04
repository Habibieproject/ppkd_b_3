import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ppkd_b_3/day_30/api/categories.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  final data = ["Jakarta", "Bogor", "Palembang", "Bandung"];
  final ImagePicker _picker = ImagePicker();
  XFile? pickedFile;
  pickFoto() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    print(image);
    print(image?.path);
    setState(() {
      pickedFile = image;
    });
    if (image == null) {
      return;
    } else {
      final response = await CategoriesAPI.postCategory(
        name: "ACAK",
        image: File(image.path),
      );
      if (response.data != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Berhasil upload gambar")));
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Gagal upload gambar")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          pickedFile != null
              ? Image.file(File(pickedFile?.path ?? ""))
              : Container(
                  decoration: BoxDecoration(
                    // shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  height: 200,
                  width: 200,

                  child: Text("Gambar belum di upload"),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: pickFoto, child: Text("Ambil Foto")),
            ],
          ),
        ],
      ),
    );
  }
}
