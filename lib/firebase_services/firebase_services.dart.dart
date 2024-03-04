import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/models/user_model.dart';
import 'package:todo_app/models/user_note_model.dart';

class FirebaseServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
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

  //.................................... Saving the userNote.............................
  Future<NoteModel> createUserNote(NoteModel noteModel) async {
    CollectionReference usersNotesReference =
        _firestore.collection('usersNotes');
    DocumentReference userNoteDocumentReference = usersNotesReference.doc();
    await userNoteDocumentReference.set(noteModel.toJson());
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
