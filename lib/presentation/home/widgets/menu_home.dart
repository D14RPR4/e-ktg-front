import 'package:flutter/material.dart';

class MenuHome extends StatelessWidget {
  final IconData iconData;
  final String label;
  final VoidCallback onPressed;

  const MenuHome({
    super.key,
    required this.iconData,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white, // White background color
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Soft shadow for depth
              blurRadius: 12,
              offset: const Offset(0, 6),
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 30.0,
              color: Color.fromRGBO(77, 138, 240, 1), // Icon color
            ),
            const SizedBox(height: 8.0), // Space between icon and text
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.black87, // Text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
