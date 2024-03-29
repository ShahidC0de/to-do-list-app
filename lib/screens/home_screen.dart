import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/firebase_services/service_provider.dart';
import 'package:todo_app/models/user_note_model.dart';
import 'package:todo_app/routes/routes.dart';
import 'package:todo_app/screens/edit_note.dart';

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
    setState(() {});
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
      body: FutureBuilder(
          future: serviceProvider.callbackFunction(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                  backgroundColor: Colors.purple,
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              List<NoteModel> userNotes = ServiceProvider.usersNotesList;

              return Padding(
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
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: const Border(
                                    bottom: BorderSide(
                                      style: BorderStyle.solid,
                                      strokeAlign: BorderSide.strokeAlignCenter,
                                      width: 23,
                                      color: Colors.purple,
                                    ),
                                    left: BorderSide(
                                      color: Colors.purple,
                                    ),
                                    right: BorderSide(
                                      color: Colors.purple,
                                    ),
                                    top: BorderSide(
                                      color: Colors.purple,
                                    ))),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(8),
                                leading: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        userNotes[index].isChecked =
                                            !userNotes[index].isChecked;
                                        if (userNotes[index].isChecked) {
                                          serviceProvider
                                              .deleteNote(userNotes[index]);
                                        }
                                      });
                                    },
                                    icon: userNotes[index].isChecked
                                        ? const Icon(
                                            Icons.check,
                                            color: Colors.purple,
                                          )
                                        : const Icon(
                                            Icons.check_box_outline_blank)),
                                title: Text(
                                  note.title,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                trailing: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.purple,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (ctx) =>
                                                EditNote(noteModel: note),
                                          ),
                                        );
                                      });
                                    },
                                    child: const Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(child: Text('no notes found'));
            }
          }),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 80,
          width: 80,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
            ),
            onPressed: () {
              setState(() {
                Navigator.of(context).pushNamed(addNoteView);
              });
            },
            child: const Center(
              child: Icon(
                size: 35,
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
