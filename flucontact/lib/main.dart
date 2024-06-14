import 'package:flutter/material.dart';
import 'page/homepage.dart';
import 'function/function.dart';
import 'page/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Initialise le binding Flutter
  bool tokenExist = await doesTokenExist();
  runApp(MyApp(initialPage: tokenExist ? const HomePage() : const LoginPage()));
}

class MyApp extends StatelessWidget {
  final Widget initialPage;

  const MyApp({super.key, required this.initialPage});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestionnaire de contacts',
      theme: ThemeData(
        fontFamily: 'Proxima Nova',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF008E4F)),
        useMaterial3: true,
      ),
      home: initialPage,
    );
  }
}
