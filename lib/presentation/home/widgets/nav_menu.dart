import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class NavMenu extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isActive;
  final VoidCallback onPressed;

  const NavMenu({
    super.key,
    required this.iconPath,
    required this.label,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(18.0)),
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isActive ? AppColors.white : null,
          borderRadius: const BorderRadius.all(Radius.circular(18.0)),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                color: isActive ? AppColors.darkGrey : AppColors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            if (isActive) SizedBox(width: 2.0),
          ],
        ),
      ),
    );
  }
}
