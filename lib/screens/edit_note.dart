import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/firebase_services/service_provider.dart';
import 'package:todo_app/models/user_note_model.dart';
import 'package:todo_app/routes/routes.dart';

class EditNote extends StatefulWidget {
  final NoteModel noteModel;
  const EditNote({super.key, required this.noteModel});

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  @override
  Widget build(BuildContext context) {
    TextEditingController title =
        TextEditingController(text: widget.noteModel.title);
    TextEditingController note =
        TextEditingController(text: widget.noteModel.userNote);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Note',
          style: GoogleFonts.acme(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const SizedBox(
              height: 24.0,
            ),
            TextFormField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              controller: title,
              decoration: InputDecoration(
                hintText: widget.noteModel.title,
                prefixIcon: const Icon(
                  Icons.title,
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
            const SizedBox(
              height: 24,
            ),
            TextFormField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              controller: note,
              decoration: InputDecoration(
                hintText: widget.noteModel.userNote,
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
                  await ServiceProvider().updateNote(widget.noteModel.userId,
                      title.text, widget.noteModel.documentId, note.text);
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
