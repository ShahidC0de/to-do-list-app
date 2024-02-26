import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: SizedBox(
          height: 5,
          width: 5,
          child: CupertinoButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.purple,
              size: 30,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          'Login',
          style: GoogleFonts.acme(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
            fontSize: 50,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 100,
              child: TextFormField(),
            )
          ],
        ),
      ),
    );
  }
}
