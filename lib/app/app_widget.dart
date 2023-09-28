import 'package:flutter/material.dart';
import 'package:m_s_afinador/app/app_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6CE8DC)),
          useMaterial3: true,
          fontFamily: 'Cousine',
        ),
        routes: AppRoutes.all,
      ),
    );
  }
}
