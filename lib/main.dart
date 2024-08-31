import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zakariae_marbre/presentation/screens/login_screen.dart';
import 'package:zakariae_marbre/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyAoSJUYFZwdzLk_NoMHNk5clFnXBOvV6-8',
      appId: 'com.example.zakariae_marbre',
      messagingSenderId: 'sendid',
      projectId: 'zakariae-marbel',
      storageBucket: 'zakariae-marbel.appspot.com',
    ),
  );
  await FirebaseAuth.instance.signOut();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const SafeArea(child: LoginScreen()),
    );
  }
}
