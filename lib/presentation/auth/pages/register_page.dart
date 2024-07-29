import 'dart:math';

import 'package:e_ktg_mobile/core/extensions/build_context_ext.dart';
import 'package:e_ktg_mobile/data/datasources/auth_local_datasources.dart';
import 'package:e_ktg_mobile/data/model/request/auth_register_request_model.dart';
import 'package:e_ktg_mobile/data/model/request/auth_validate_request_model.dart';
import 'package:e_ktg_mobile/presentation/auth/bloc/validate/validate_bloc.dart';
import 'package:e_ktg_mobile/presentation/auth/bloc/register/register_bloc.dart';
import 'package:e_ktg_mobile/presentation/auth/widgets/register_title%20.dart';
import 'package:e_ktg_mobile/presentation/home/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/custom_text_field.dart';
import '../../../core/constants/colors.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Variable untuk menyimpan kode verifikasi acak
  int randomNumber = 10000;

  // Server SMTP untuk mengirim email
  late final SmtpServer smtpServer;

  // Controller untuk input nama, email, dan password
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // FocusNode untuk fokus pada input nama
  final FocusNode nameFocusNode = FocusNode();

  // Variabel untuk menyimpan input pengguna
  String name = '';
  String email = '';
  String password = '';
  String confirm_password = '';
  bool isButtonDisabled = true;
  String buttonText = 'Verifikasi';

  @override
  void initState() {
    super.initState();
    // Inisialisasi server SMTP saat widget dibuat
    smtpServer =
        gmail(dotenv.env["MAIL_USERNAME"]!, dotenv.env["MAIL_PASSWORD"]!);
    // Menambahkan listener ke controller input untuk memperbarui status tombol
    usernameController.addListener(enableButton);
    emailController.addListener(enableButton);
    passwordController.addListener(enableButton);
    // Menghasilkan angka acak saat widget dibuat
    random();
    // Meminta fokus pada input nama saat widget dibangun
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(nameFocusNode);
    });
  }

  // Fungsi untuk menghasilkan angka acak
  void random() {
    setState(() {
      Random random = new Random();
      randomNumber = random.nextInt(99999);
    });
  }

  // Fungsi untuk menyimpan input pengguna dan mengirim email verifikasi
  void saveInput() {
    setState(() {
      name = usernameController.text;
      email = emailController.text;
      password = passwordController.text;
      confirm_password = passwordController.text;
      isButtonDisabled = false;
      buttonText = 'Kirim Ulang Kode Verifikasi';
    });
    sendMailFromGoogle();
  }

  // Fungsi untuk mengaktifkan atau menonaktifkan tombol berdasarkan input
  void enableButton() {
    setState(() {
      isButtonDisabled = usernameController.text.isEmpty ||
          emailController.text.isEmpty ||
          passwordController.text.isEmpty;
      buttonText = 'Verifikasi';
    });
  }

  // Fungsi untuk mengirim email verifikasi menggunakan Google SMTP
  void sendMailFromGoogle() async {
    final message = Message()
      ..from = Address(dotenv.env["MAIL_USERNAME"]!, 'Your name')
      ..recipients.add(email)
      ..subject = 'Kode Verifikasi: $randomNumber'
      ..text = 'Kode verifikasi Anda adalah $randomNumber.\n'
      ..html =
          "<h1>Kode Verifikasi</h1>\n<p>Kode verifikasi Anda adalah $randomNumber.</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          RegisterTitle(),
          CustomTextField(
            controller: emailController,
            label: 'Alamat Email',
          ),
          const SizedBox(height: 16.0),
          CustomTextField(
            controller: usernameController,
            label: 'Name',
          ),
          const SizedBox(height: 16.0),
          CustomTextField(
            controller: passwordController,
            label: 'Password min-8 karakter',
            obscureText: true,
          ),
          const SizedBox(height: 24.0),
          BlocConsumer<ValidateBloc, ValidateState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                success: (state) {
                  random();
                  // Delay untuk mensimulasikan proses pengiriman email
                  Future.delayed(
                    const Duration(seconds: 2),
                    () {
                      saveInput();
                    },
                  );
                },
                error: (message) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(message),
                    backgroundColor: Colors.red,
                  ));
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(orElse: () {
                return ElevatedButton(
                  onPressed: isButtonDisabled
                      ? null
                      : () {
                          final dataRequest =
                              ValidateRequestModel(email: emailController.text);
                          context
                              .read<ValidateBloc>()
                              .add(ValidateEvent.validate(dataRequest));
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: Text(
                    buttonText,
                    style: TextStyle(color: AppColors.white),
                  ),
                );
              }, loading: () {
                return Button.filled(
                  onPressed: () {},
                  label: 'MOHON TUNGGU...',
                  icon: const SizedBox(
                    height: 20.0,
                    width: 20.0,
                    child: CircularProgressIndicator(
                      color: AppColors.white,
                      strokeWidth: 1.0,
                    ),
                  ),
                );
              });
            },
          ),
          const SizedBox(height: 20),
          Center(
            child: Text("Masukkan Kode Verifikasi $randomNumber"),
          ),
          const SizedBox(height: 20),
          BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () async {},
                success: (state) {
                  AuthLocalDatasource().saveAuthData(state);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('REGISTER BERHASIL'),
                    backgroundColor: Colors.green,
                  ));
                  Future.delayed(
                    const Duration(seconds: 1),
                    () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashboardPage()),
                    ),
                  );
                },
                error: (message) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(message),
                    backgroundColor: Colors.red,
                  ));
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return OtpTextField(
                    numberOfFields: 5,
                    borderColor: const Color(0xFF512DA8),
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {
                      // Handle validasi atau pengecekan di sini jika diperlukan
                    },
                    onSubmit: (String verificationCode) {
                      if (randomNumber == int.parse(verificationCode)) {
                        final dataRequest = RegisterRequestModel(
                          name: name,
                          email: email,
                          password: password,
                          passwordConfirmation: confirm_password,
                        );
                        context
                            .read<RegisterBloc>()
                            .add(RegisterEvent.register(dataRequest));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('KODE VERIFIKASI SALAH'),
                          backgroundColor: Colors.red,
                        ));
                      }
                    },
                  );
                },
                loading: () {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary, // Warna indikator
                      strokeWidth: 1.0, // Lebar garis indikator
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(height: 24.0),
          GestureDetector(
            onTap: () {
              context.pushReplacement(const LoginPage());
            },
            child: Text.rich(
              TextSpan(
                text: 'Sudah Punya Akun?? ',
                children: [
                  TextSpan(
                    text: 'Sign in',
                    style: TextStyle(color: AppColors.primary),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
