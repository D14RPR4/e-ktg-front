import 'package:e_ktg_mobile/core/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/components/buttons.dart';
import '../../../data/datasources/onboarding_local_datasource.dart';
import '../../auth/pages/login_page.dart';
import '../models/onboarding_model.dart';
import '../widgets/onboarding_content.dart';
import '../widgets/onboarding_indicator.dart';
import '../widgets/skip_button.dart';
// import '../widgets/skip_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentPage = 0;
  final pageController = PageController();

  final onboardingData = [
    OnboardingModel(
      image: Assets.images.onboarding.screen1.path,
      text: 'Selamat Datang Di Electronic Ketapang Travel Guide !',
    ),
    OnboardingModel(
      image: Assets.images.onboarding.screen2.path,
      text:
          'Jelajahi Destinasi Wisata Yang Ingin Anda Kunjungi Di Kabupaten Ketapang !',
    ),
    OnboardingModel(
      image: Assets.images.onboarding.screen3.path,
      text: 'Temukan Hal-Hal Menarik Yang Ada Di Kabupaten Ketapang !',
    ),
  ];

  void navigate() {
    context.pushReplacement(const LoginPage());
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SkipButton(onPressed: navigate),
              OnboardingContent(
                pageController: pageController,
                onPageChanged: (index) {
                  currentPage = index;
                  setState(() {});
                },
                contents: onboardingData,
              ),
              OnboardingIndicator(
                length: onboardingData.length,
                currentPage: currentPage,
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Button.filled(
                  onPressed: () {
                    if (currentPage < onboardingData.length - 1) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                      currentPage++;
                      setState(() {});
                    } else {
                      OnboardingLocalDatasource().saveOnboadingPassed();
                      navigate();
                    }
                  },
                  label: 'Continue',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
