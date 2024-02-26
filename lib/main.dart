import 'package:flutter/material.dart';
import 'package:todo_app/routes/routes.dart';
import 'package:todo_app/screens/login_screen.dart';
import 'package:todo_app/screens/welome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        loginView: (context) => const LoginScreen(),
      },
      home: const WelcomeScreen(),
    );
  }
}
