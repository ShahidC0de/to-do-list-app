import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase_services/service_provider.dart';
import 'package:todo_app/routes/routes.dart';
import 'package:todo_app/screens/add_note.dart';
import 'package:todo_app/screens/email_verification_screen.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/screens/login_screen.dart';
import 'package:todo_app/screens/sign_up_screen.dart';
import 'package:todo_app/screens/welome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyBFm6liY8qRRFzH10oySU-WxDuajaXXAhQ',
          appId: '1:175033586289:android:46833a97c3a2169d4681d0',
          messagingSenderId: '175033586289',
          projectId: 'todolistapp344'));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ServiceProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          loginView: (context) => const LoginScreen(),
          signView: (context) => const SignUpView(),
          homeView: (context) => const HomeScreen(),
          verificationEmailScreen: (context) => const EmailVerification(),
          addNoteView: (context) => const AddNote(),
        },
        home: const WelcomeScreen(),
      ),
    );
  }
}
