import 'package:e_ktg_mobile/data/datasources/auth_local_datasources.dart';
import 'package:e_ktg_mobile/data/datasources/berita_remote_datasource.dart';
import 'package:e_ktg_mobile/data/datasources/desa_remote_datasource.dart';
import 'package:e_ktg_mobile/data/datasources/fasilitas_hotel_remote_datasource.dart';
import 'package:e_ktg_mobile/data/datasources/fasilitas_resto_datasource.dart';
import 'package:e_ktg_mobile/data/datasources/fasilitas_travel_datasource.dart';
import 'package:e_ktg_mobile/data/datasources/kalender_event_remote_datasource.dart';
import 'package:e_ktg_mobile/data/datasources/wisata_alam_remote_datasource.dart';
import 'package:e_ktg_mobile/data/datasources/wisata_buatan_datasource.dart';
import 'package:e_ktg_mobile/data/datasources/wisata_budaya_datasource.dart';
import 'package:e_ktg_mobile/data/model/responses/auth_response_model.dart';
import 'package:e_ktg_mobile/presentation/atraksi/bloc/wisata_alam/delete_comment/delete_comment_bloc.dart';
import 'package:e_ktg_mobile/presentation/atraksi/bloc/wisata_alam/post_comment/post_comment_bloc.dart';
import 'package:e_ktg_mobile/presentation/atraksi/bloc/wisata_alam/get_comment/get_comment_bloc.dart';
import 'package:e_ktg_mobile/presentation/atraksi/bloc/wisata_alam/like/like_bloc.dart';
import 'package:e_ktg_mobile/presentation/atraksi/bloc/wisata_alam/get_alam/alam_bloc.dart';
import 'package:e_ktg_mobile/presentation/atraksi/bloc/wisata_buatan/get_buatan/buatan_bloc.dart';
import 'package:e_ktg_mobile/presentation/atraksi/bloc/wisata_budaya/get_budaya/budaya_bloc.dart';
import 'package:e_ktg_mobile/presentation/auth/bloc/login/login_bloc.dart';
import 'package:e_ktg_mobile/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:e_ktg_mobile/presentation/auth/bloc/validate/validate_bloc.dart';
import 'package:e_ktg_mobile/presentation/auth/pages/login_page.dart';
import 'package:e_ktg_mobile/presentation/berita/bloc/get_berita/berita_bloc.dart';
import 'package:e_ktg_mobile/presentation/desa_wisata/bloc/desa_wisata/desa_bloc.dart';
import 'package:e_ktg_mobile/presentation/fasilitas/bloc/fasilitas_hotel/get_comment/get_comment_hotel_bloc.dart';
import 'package:e_ktg_mobile/presentation/fasilitas/bloc/fasilitas_hotel/get_hotel/hotel_bloc.dart';
import 'package:e_ktg_mobile/presentation/fasilitas/bloc/fasilitas_resto/bloc/resto_bloc.dart';
import 'package:e_ktg_mobile/presentation/fasilitas/bloc/fasilitas_travel/bloc/travel_bloc.dart';
import 'package:e_ktg_mobile/presentation/home/pages/dashboard_page.dart';
import 'package:e_ktg_mobile/presentation/kalender/bloc/bloc/kalender_bloc.dart';
import 'package:e_ktg_mobile/presentation/onboarding/pages/onboarding_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'data/datasources/onboarding_local_datasource.dart';
import 'presentation/auth/bloc/register/register_bloc.dart';
import 'presentation/fasilitas/bloc/fasilitas_hotel/delete_comment/delete_comment_hotel_bloc.dart';
import 'presentation/fasilitas/bloc/fasilitas_hotel/post_comment/post_comment_hotel_bloc.dart';
import 'presentation/fasilitas/bloc/fasilitas_hotel/like_hotel/like_hotel_bloc.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // Handle background message
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => ValidateBloc(),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => DesaBloc(DesaRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => AlamBloc(WisataAlamRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => LikeBloc(WisataAlamRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => GetCommentBloc(WisataAlamRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => PostCommentBloc(),
        ),
        BlocProvider(
          create: (context) => DeleteCommentBloc(WisataAlamRemoteDatasource()),
        ),
        //Buatan
        BlocProvider(
          create: (context) => BuatanBloc(WisataBuatanRemoteDatasource()),
        ),
        //Budaya
        BlocProvider(
          create: (context) => BudayaBloc(WisataBudayaRemoteDatasource()),
        ),
        //Hotel
        BlocProvider(
          create: (context) => HotelBloc(FasilitasHotelRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              GetCommentHotelBloc(FasilitasHotelRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => LikeHotelBloc(FasilitasHotelRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => PostCommentHotelBloc(),
        ),
        BlocProvider(
          create: (context) =>
              DeleteCommentHotelBloc(FasilitasHotelRemoteDatasource()),
        ),
        //Resto
        BlocProvider(
          create: (context) => RestoBloc(FasilitasRestoRemoteDatasource()),
        ),
        //Travel
        BlocProvider(
          create: (context) => TravelBloc(FasilitasTravelRemoteDatasource()),
        ),
        //Travel
        BlocProvider(
          create: (context) => BeritaBloc(BeritaRemoteDatasource()),
        ),
        //kalender
        BlocProvider(
          create: (context) => KalenderBloc(KalenderEventRemoteDatasource()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Electronic Ketapang Travel Guide',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: FutureBuilder<AuthResponseModel>(
          future: AuthLocalDatasource().getAuthData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const DashboardPage();
            } else {
              return FutureBuilder<bool>(
                future: OnboardingLocalDatasource().getIsFirstTime(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data!
                        ? const LoginPage()
                        : const OnboardingPage();
                  } else {
                    return const OnboardingPage();
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }
}
