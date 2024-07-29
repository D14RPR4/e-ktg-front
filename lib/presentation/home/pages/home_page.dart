import 'package:e_ktg_mobile/core/extensions/build_context_ext.dart';
import 'package:e_ktg_mobile/presentation/atraksi/pages/atraksi_dashboard.dart';
import 'package:e_ktg_mobile/presentation/berita/pages/berita_page.dart';
import 'package:e_ktg_mobile/presentation/desa_wisata/pages/desa_wisata_page.dart';
import 'package:e_ktg_mobile/presentation/fasilitas/pages/fasilitas_dashboard.dart';
import 'package:e_ktg_mobile/presentation/home/widgets/banner_home.dart';
import 'package:e_ktg_mobile/presentation/home/widgets/detail_home.dart';
import 'package:e_ktg_mobile/presentation/kalender/pages/kalender_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../widgets/header_home.dart';
import '../widgets/menu_home.dart';

import 'about_us_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance.subscribeToTopic('berita');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        FirebaseMessaging.instance.subscribeToTopic('berita');
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BeritaPage()),
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const HeaderHome(),
          const SizedBox(height: 40.0),
          const DetailHome(),
          // const SizedBox(height: 30.0),
          const BannerHome(),
          const SizedBox(height: 24.0),
          GridView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 24.0,
            ),
            children: [
              MenuHome(
                iconData: Icons.location_city, // Ganti dengan ikon yang sesuai
                label: 'Desa Wisata',
                onPressed: () {
                  context.push(const DesaWisataPage());
                },
              ),
              MenuHome(
                iconData: Icons.local_activity, // Ganti dengan ikon yang sesuai
                label: 'Atraksi Wisata',
                onPressed: () {
                  context.push(const AtraksiDashboard());
                },
              ),
              MenuHome(
                iconData: Icons.build, // Ganti dengan ikon yang sesuai
                label: 'Fasilitas',
                onPressed: () {
                  context.push(const FasilitasDashboard());
                },
              ),
              MenuHome(
                iconData: Icons.map, // Ganti dengan ikon yang sesuai
                label: 'Peta Wisata',
                onPressed: () {
                  context.push(const AboutUsPage());
                },
              ),
              MenuHome(
                iconData: Icons.article, // Ganti dengan ikon yang sesuai
                label: 'Berita',
                onPressed: () {
                  context.push(const BeritaPage());
                },
              ),
              MenuHome(
                iconData: Icons.calendar_today, // Ganti dengan ikon yang sesuai
                label: 'Kalender Event',
                onPressed: () {
                  context.push(const KalenderPage());
                },
              ),
            ],
          ),
          const SizedBox(height: 30.0),
        ],
      ),
    );
  }
}
