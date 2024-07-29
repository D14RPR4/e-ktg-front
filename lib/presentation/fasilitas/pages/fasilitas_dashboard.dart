import 'package:e_ktg_mobile/presentation/fasilitas/pages/fasilitas_hotel_page.dart';
import 'package:e_ktg_mobile/presentation/fasilitas/pages/fasilitas_resto_page.dart';
import 'package:e_ktg_mobile/presentation/fasilitas/pages/fasilitas_travel_page.dart';
import 'package:flutter/material.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/constants/colors.dart';
import '../../home/widgets/nav_menu.dart';

class FasilitasDashboard extends StatefulWidget {
  const FasilitasDashboard({super.key});

  @override
  State<FasilitasDashboard> createState() => _FasilitasDashboardState();
}

class _FasilitasDashboardState extends State<FasilitasDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const FasilitasHotelPage(),
    const FasilitasRestolPage(),
    const FasilitasTravelPage(),
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
          color: AppColors.primary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavMenu(
              iconPath: Assets.icons.home.path,
              label: 'Hotel',
              isActive: _selectedIndex == 0,
              onPressed: () => _onItemTapped(0),
            ),
            NavMenu(
              iconPath: Assets.icons.message.path,
              label: 'Resto',
              isActive: _selectedIndex == 1,
              onPressed: () => _onItemTapped(1),
            ),
            NavMenu(
              iconPath: Assets.icons.bell.path,
              label: 'Travel',
              isActive: _selectedIndex == 2,
              onPressed: () => _onItemTapped(2),
            ),
          ],
        ),
      ),
    );
  }
}
