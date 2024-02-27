import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/routes/routes.dart';
import 'package:todo_app/screens/sign_up_screen.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            SizedBox(
              height: 60,
              width: 300,
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'E-mail',
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.purple,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.purple,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.purple,
                          width: 4,
                        ))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 60,
              width: 300,
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Icon(
                      Icons.password,
                      color: Colors.purple,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.purple,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.purple,
                          width: 4,
                        ))),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                //   Navigator.of(context).pushNamed(loginView);
              },
              child: Text(
                'Sign In',
                style: GoogleFonts.acme(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(signView);
                },
                child: Text(
                  "Don't have an account?",
                  style: GoogleFonts.acme(
                    color: Colors.purple,
                    fontSize: 15,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
