import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Email Verification",
          style: GoogleFonts.acme(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: Colors.purple,
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Text('please verify your email to proceed '),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
