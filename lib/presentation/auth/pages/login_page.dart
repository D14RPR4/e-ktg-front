import 'package:e_ktg_mobile/data/datasources/auth_local_datasources.dart';
import 'package:e_ktg_mobile/data/model/request/auth_login_request_model.dart';
import 'package:e_ktg_mobile/presentation/auth/bloc/login/login_bloc.dart';
import 'package:e_ktg_mobile/presentation/home/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:e_ktg_mobile/core/extensions/build_context_ext.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/assets/assets.gen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/custom_text_field.dart';
import '../../../core/constants/colors.dart';
import '../widgets/login_title.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        // Menutup aplikasi saat tombol kembali ditekan
        SystemNavigator.pop();
        return false; // Mengembalikan false agar tombol kembali tidak diizinkan
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          centerTitle: true,
          automaticallyImplyLeading: false, // Menghilangkan tombol kembali
          title: Image.asset(
            Assets.images.logo.path, // Ganti dengan path ke logo Anda
            height: 40.0, // Sesuaikan tinggi logo
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(24.0),
          children: [
            LoginTitle(),
            CustomTextField(
              controller: emailController,
              label: 'Email Address',
            ),
            const SizedBox(height: 16.0),
            CustomTextField(
              controller: passwordController,
              label: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Forgot Password?',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
            ),
            const SizedBox(height: 42.0),
            BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                state.maybeWhen(
                    orElse: () {},
                    success: (data) {
                      //simpan data ke local storage
                      AuthLocalDatasource().saveAuthData(data);
                      //snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'LOGIN BERHASIL',
                            style: TextStyle(color: Colors.black),
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                      context.pushReplacement(const DashboardPage());
                    },
                    error: (message) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message,
                              style: const TextStyle(color: Colors.black)),
                          backgroundColor: Colors.red,
                        ),
                      );
                    });
              },
              builder: (context, state) {
                return state.maybeWhen(
                    orElse: () => Button.filled(
                          onPressed: () {
                            // context.pushReplacement(const DashboardPage());
                            final requestModel = LoginRequestModel(
                                email: emailController.text,
                                password: passwordController.text);
                            context
                                .read<LoginBloc>()
                                .add(LoginEvent.login(requestModel));
                          },
                          label: 'LOG IN',
                        ),
                    loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ));
              },
            ),
            const SizedBox(height: 24.0),
            GestureDetector(
              onTap: () {
                context.pushReplacement(RegisterPage());
              },
              child: const Text.rich(
                TextSpan(
                  text: 'Don\'t have an account? ',
                  children: [
                    TextSpan(
                      text: 'Sign up',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
