import 'package:flutter/material.dart';
import 'package:todo_app/firebase_services/service_provider.dart';
import 'package:todo_app/routes/routes.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  @override
  @override
  Widget build(BuildContext context) {
    ServiceProvider serviceProvider = ServiceProvider();
    TextEditingController note = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: TextFormField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                controller: note,
                decoration: InputDecoration(
                  hintText: 'Enter Note',
                  prefixIcon: const Icon(
                    Icons.note_add,
                    color: Color.fromARGB(255, 5, 5, 5),
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
            const SizedBox(height: 12),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () async {
                  await serviceProvider.createUserNote(note.text);
                  // ignore: use_build_context_synchronously
                  setState(() {
                    Navigator.of(context).pushNamed(homeView);
                  });
                },
                child: const Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
