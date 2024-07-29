import 'package:flutter/material.dart';

import '../../../core/assets/assets.gen.dart';

class LoginTitle extends StatefulWidget {
  const LoginTitle({super.key});

  @override
  State<LoginTitle> createState() => _LoginTitleState();
}

class _LoginTitleState extends State<LoginTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      child: Column(
        children: [
          Image.asset(
            Assets.images.auth
                .path, // Menggunakan Image.asset untuk menampilkan gambar
            height: 350.0, // Sesuaikan tinggi gambar jika diperlukan
            width: 350.0, // Sesuaikan lebar gambar jika diperlukan
          ),
          Text(
            'Login',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
              height:
                  30.0), // Menambahkan ruang antara teks dan elemen berikutnya
        ],
      ),
    );
  }
}
