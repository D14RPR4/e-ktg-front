import 'package:e_ktg_mobile/core/extensions/build_context_ext.dart';
import 'package:e_ktg_mobile/data/datasources/auth_local_datasources.dart';
import 'package:e_ktg_mobile/data/model/responses/auth_response_model.dart';
import 'package:e_ktg_mobile/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:e_ktg_mobile/presentation/auth/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/custom_scaffold.dart';
import '../widgets/profile_menu.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showBackButton: true,
      toolbarHeight: 60.0,
      appBarTitle: Row(
        children: [
          SizedBox(
            width: context.deviceWidth - 100.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<AuthResponseModel>(
                  future: AuthLocalDatasource().getAuthData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Halo, ' + snapshot.data!.user.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            snapshot.data!.user.email,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                )
              ],
            ),
          ),
          const Spacer(),
          // IconButton(
          //   onPressed: () {
          //     context.pushAndRemoveUntil(const LoginPage(), (route) => false);
          //   },
          //   icon: Assets.icons.logout.image(width: 24.0),
          // ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(30.0),
        children: [
          const SizedBox(height: 16.0),
          const Text(
            'Account',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8.0),
          ProfileMenu(
            label: 'Tentang Kami',
            onPressed: () {
              
            },
          ),
          ElevatedButton(
            onPressed: () {
              context.read<LogoutBloc>().add(const LogoutEvent.logout());
              AuthLocalDatasource().removeAuthData();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false, // Hapus semua rute sebelumnya
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red, // Warna latar belakang tombol
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(5), // Membuat sudut tombol melengkung
              ),
            ),
            child: const Text('Logout'),
          )
        ],
      ),
    );
  }
}
