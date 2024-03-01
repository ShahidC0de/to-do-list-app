import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/firebase_services/service_provider.dart';
import 'package:todo_app/routes/routes.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();

    ServiceProvider serviceProvider = ServiceProvider();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: GoogleFonts.acme(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
            fontSize: 50,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.purple,
            )),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 60,
                  width: 300,
                  child: TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                        hintText: 'Full Name',
                        prefixIcon: const Icon(
                          Icons.person,
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
                    controller: email,
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
                    controller: password,
                    decoration: InputDecoration(
                        hintText: 'Choose a password',
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
                  height: 20,
                ),
                SizedBox(
                  height: 60,
                  width: 300,
                  child: TextFormField(
                    controller: confirmPassword,
                    decoration: InputDecoration(
                        hintText: 'Confirm Password',
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
                const Divider(
                  thickness: 5,
                  color: Colors.purple,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () async {
                    const CircularProgressIndicator();
                    bool userIsValid =
                        await serviceProvider.createUserWithEmailAndPassword(
                      name.text,
                      email.text,
                      password.text,
                      confirmPassword.text,
                    );
                    if (userIsValid) {
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pop();
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushNamed(homeView);
                    }
                  },
                  child: Text(
                    'Create Account',
                    style: GoogleFonts.acme(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Already have an account?',
                      style: GoogleFonts.acme(
                        color: Colors.purple,
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}
