import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/firebase_services/service_provider.dart';
import 'package:todo_app/models/user_model.dart';
import 'package:todo_app/models/user_note_model.dart';

class FirebaseServices {
  final FirebaseFirestore _firestore = FirebaseFirestore
      .instance; // creating an instance of the firebase firestore.

  final FirebaseAuth _auth = FirebaseAuth.instance; //firebaseAuth instance.
  //......................... getting currentuserId.....................

  String getUserId() {
    String userId = _auth.currentUser!.uid;
    return userId;
  }

  //................................... fetch all notes of current user...................
  Future<List<NoteModel>> fetchUserNotes() async {
    List<NoteModel> userNotes = [];
    String currentUserId = getUserId();
    QuerySnapshot querySnapshot = await _firestore
        .collection('usersNotes')
        .where('userId', isEqualTo: currentUserId)
        .get();
    userNotes = querySnapshot.docs
        .map((doc) => NoteModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
    return userNotes;
  }

  // .................................................. deleting the userNote ...........................
  Future<NoteModel> deleteTheUserNote(NoteModel noteModel) async {
    String documentId = noteModel.documentId;
    CollectionReference collectionReference =
        _firestore.collection('usersNotes');
    collectionReference.doc(documentId).delete();
    return noteModel;
  }

  //.................................... updating userNote ............................
  Future<NoteModel> updateUserNote(
      String documentId, String userNote, String title, String userId) async {
    NoteModel noteModel = NoteModel(
        userId: userId,
        title: title,
        userNote: userNote,
        documentId: documentId,
        isChecked: false);
    await _firestore
        .collection('usersNotes')
        .doc(noteModel.documentId)
        .update(noteModel.toJson());
    return noteModel;
  }

  //.................................... Saving the userNote.............................
  Future<NoteModel> createUserNote(
    String userId,
    String note,
    String title,
  ) async {
    CollectionReference usersNotesReference =
        _firestore.collection('usersNotes');
    DocumentReference userNoteDocumentReference = usersNotesReference.doc();
    NoteModel noteModel = NoteModel(
        title: title,
        isChecked: false,
        userId: userId,
        userNote: note,
        documentId: userNoteDocumentReference.id);
    await userNoteDocumentReference.set(noteModel.toJson());
    ServiceProvider.usersNotesList.add(noteModel);
    return noteModel;
  }

  //...................................Create User .....................................
  Future<UserModel?> createUser(
    UserModel userModel,
  ) async {
    try {
      DocumentReference documentReference =
          _firestore.collection('users').doc(userModel.userId);
      documentReference.set(userModel.toJson());
      return userModel;
    } catch (e) {
      return null;
    }
  }

//.......................................... signIn the user...................................
  Future<void> logInTheUser(
    String email,
    String password,
  ) async {
    try {
      _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (_) {}
  }
}
