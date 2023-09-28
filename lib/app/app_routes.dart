import 'package:flutter/material.dart';
import 'package:m_s_afinador/app/presentation/splash/views/pages/splash_page.dart';
import 'presentation/home/views/pages/home_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get all => {
        '/splash': (context) => const SplashPage(),
        '/': (context) => const HomePage(),
      };

  static dynamic getArgs(context) => ModalRoute.of(context)?.settings.arguments;
}
