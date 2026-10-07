import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../features/startup/presentation/splash_page.dart';

class CampoCertoApp extends StatelessWidget {
  const CampoCertoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CampoCerto',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.tema,
      home: const SplashPage(),
    );
  }
}
