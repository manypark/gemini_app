import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gemini_app/config/config.dart';

void main() {

  AppTheme.setSystemUIOverlayStyle( isDarkMode: true );

  runApp( ProviderScope( child : GeminiApp() ) );
}

class GeminiApp extends StatelessWidget {
  const GeminiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner : false,
      routerConfig          : appRouter,
      theme                 : AppTheme(isDarkMode: true).getTheme(),
    );
  }
}
