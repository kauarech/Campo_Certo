import 'package:flutter/material.dart';
import '../../onboarding/presentation/onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    abrirOnboarding();
  }

  Future<void> abrirOnboarding() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const OnboardingPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F5),
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 250,
        ),
      ),
    );
  }
}