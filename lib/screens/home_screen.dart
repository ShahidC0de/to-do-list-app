import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/firebase_services/service_provider.dart';
import 'package:todo_app/models/user_note_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ServiceProvider serviceProvider = ServiceProvider();
  TextEditingController note = TextEditingController();
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: serviceProvider.callbackFunction(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<NoteModel> userNotes = ServiceProvider.usersNotesList;

            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                automaticallyImplyLeading: false,
                title: Text(
                  "Home",
                  style: GoogleFonts.acme(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.purple,
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        itemCount: userNotes.length,
                        shrinkWrap: true, // Wrap content tightly
                        physics:
                            const NeverScrollableScrollPhysics(), // Disable scrolling
                        itemBuilder: (context, index) {
                          NoteModel note = userNotes[index];
                          return ListTile(
                            title: Text(note.userNote),
                          );
                        },
                      ),
                      const Divider(),
                      SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Center(
                              child: TextFormField(
                                controller: note,
                                decoration: InputDecoration(
                                  hintText: 'Enter Note',
                                  prefixIcon: const Icon(
                                    Icons.note_add,
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
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: SizedBox(
                                height: 60,
                                width: 60,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () async {
                                    await serviceProvider
                                        .createUserNote(note.text);
                                    userNotes.add(NoteModel(
                                        userId: FirebaseAuth
                                            .instance.currentUser!.uid,
                                        userNote: note.text));
                                    setState(() {});
                                  },
                                  child: const Icon(
                                    Icons.send,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Text('no notes found');
          }
        });
  }
}
