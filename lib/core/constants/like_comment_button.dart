import 'package:e_ktg_mobile/core/constants/colors.dart';
import 'package:flutter/material.dart';

Widget kLikeAndComment(
  int value,
  IconData icon,
  Color color,
  Function onTap,
) {
  return InkWell(
    onTap: () => onTap(),
    borderRadius: BorderRadius.circular(5),
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 24,
            color: color,
          ),
          SizedBox(width: 4), // Added space between the icon and the text
          Text(
            '$value',
            style: TextStyle(color: AppColors.black),
          ),
        ],
      ),
    ),
  );
}

Widget expandedProgresLikeAndComment() {
  return Expanded(
    child: Material(
      child: InkWell(
        onTap: () {
          // Tambahkan logika yang diinginkan ketika widget ditekan
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 16, // Lebar dan tinggi ikon
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2.0, // Lebar garis indikator
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.blue), // Warna progres indikator
                  backgroundColor:
                      Colors.grey[300], // Warna latar belakang indikator
                ),
              ),
              SizedBox(width: 4),
              // Tambahkan elemen lain jika diperlukan
            ],
          ),
        ),
      ),
    ),
  );
}

// --- input decoration
InputDecoration kInputDecoration(String label) {
  return InputDecoration(
      labelText: label,
      contentPadding: EdgeInsets.all(10),
      border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.black)));
}

// button

TextButton kTextButton(String label, Function onPressed) {
  return TextButton(
    child: Text(
      label,
      style: TextStyle(color: Colors.white),
    ),
    style: ButtonStyle(
        backgroundColor:
            WidgetStateColor.resolveWith((states) => Colors.blue),
        padding: WidgetStateProperty.resolveWith(
            (states) => EdgeInsets.symmetric(vertical: 10))),
    onPressed: () => onPressed(),
  );
}
