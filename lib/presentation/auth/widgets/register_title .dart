import 'package:flutter/material.dart';

import '../../../core/assets/assets.gen.dart';

class RegisterTitle extends StatefulWidget {
  const RegisterTitle({super.key});

  @override
  State<RegisterTitle> createState() => _RegisterTitleState();
}

class _RegisterTitleState extends State<RegisterTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      child: Column(
        children: [
          Image.asset(
            Assets.images.auth2
                .path, // Menggunakan Image.asset untuk menampilkan gambar
            height: 230.0, // Sesuaikan tinggi gambar jika diperlukan
            width: 230.0, // Sesuaikan lebar gambar jika diperlukan
          ),
          Text(
            'Register',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
              height:
                  10.0), // Menambahkan ruang antara teks dan elemen berikutnya
        ],
      ),
    );
  }
}
