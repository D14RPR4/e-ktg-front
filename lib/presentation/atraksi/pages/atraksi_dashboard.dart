import 'package:e_ktg_mobile/presentation/atraksi/pages/wisata_alam_page.dart';
import 'package:e_ktg_mobile/presentation/atraksi/pages/wisata_buatan_page.dart';
import 'package:e_ktg_mobile/presentation/atraksi/pages/wisata_budaya_page.dart';
import 'package:flutter/material.dart';

import '../../../core/assets/assets.gen.dart';
import '../../home/widgets/nav_menu.dart';

class AtraksiDashboard extends StatefulWidget {
  const AtraksiDashboard({super.key});

  @override
  State<AtraksiDashboard> createState() => _AtraksiDashboardState();
}

class _AtraksiDashboardState extends State<AtraksiDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const WisataAlamPage(),
    const WisataBuatanPage(),
    const WisataBudayaPage(),
  ];

  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
          color: Color.fromRGBO(77, 138, 240, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavMenu(
              iconPath: Assets.icons.home.path,
              label: 'Alam',
              isActive: _selectedIndex == 0,
              onPressed: () => _onItemTapped(0),
            ),
            NavMenu(
              iconPath: Assets.icons.message.path,
              label: 'Buatan',
              isActive: _selectedIndex == 1,
              onPressed: () => _onItemTapped(1),
            ),
            NavMenu(
              iconPath: Assets.icons.bell.path,
              label: 'Budaya',
              isActive: _selectedIndex == 2,
              onPressed: () => _onItemTapped(2),
            ),
          ],
        ),
      ),
    );
  }
}
