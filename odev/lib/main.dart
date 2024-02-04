import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:odev/pages/device_info.dart';
import 'package:odev/pages/home_page.dart';
import 'package:odev/pages/login_page.dart';
import 'package:odev/pages/navbar_page.dart';
import 'package:odev/pages/onboarding_page.dart';
import 'package:odev/pages/onboarding_page2.dart';
import 'package:odev/pages/playlist_screen.dart';
import 'package:odev/pages/profile_page.dart';
import 'package:odev/pages/register_page.dart';
import 'package:odev/pages/song_page.dart';
import 'package:odev/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/onboarding',
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/profile': (context) => const ProfilePage(),
        '/onboarding': (context) => const OnboardingPage(),
        '/onboarding2': (context) => const OnboardingPage2(),
        '/welcome': (context) => const WelcomePage(),
        '/navbar': (context) => const MainNavBar(),
        '/song': (context) => const SongScreen(),
        '/playlist': (context) => const PlaylistScreen(),
        '/device': (context) => const DeviceInfo(),
      },
      //tema ayarları
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

