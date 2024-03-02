import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/firebase_services/service_provider.dart';
import 'package:todo_app/models/user_note_model.dart';

class HomeScreen extends StatefulWidget {
  final List<NoteModel> userNotes;
  const HomeScreen({Key? key, required this.userNotes}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ServiceProvider serviceProvider = ServiceProvider();
    TextEditingController note = TextEditingController();
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
        child: Column(
          children: [
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Your scrollable content here
                    // For example, you can add Text widgets or other widgets
                    // Spacer(),
                    // Spacer(),
                  ],
                ),
              ),
            ),
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
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () async {
                              await serviceProvider.createUserNote(note.text);
                            },
                            child: const Icon(
                              Icons.send,
                              color: Colors.white,
                            ))),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            )
          ],
        ),
      ),
    );
  }
}
