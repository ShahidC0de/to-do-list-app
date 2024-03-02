import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/firebase_services/firebase_services.dart.dart';
import 'package:todo_app/models/user_model.dart';
import 'package:todo_app/models/user_note_model.dart';

class ServiceProvider extends ChangeNotifier {
  //..............................................CLASSES INSTANCE...............................
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseServices _firebaseServices = FirebaseServices();
  //..............................................LISTS..........................................
  List<UserModel> usersList = [];

  //..................................getting all the notes belongs to current user ......................
  Future<List<NoteModel>> callbackFunction() async {
    List<NoteModel> userNotes = [];

    userNotes = await _firebaseServices.fetchUserNotes();
    return userNotes;
  }

  //............................................Creating User Note ..................
  Future<void> createUserNote(String userNote) async {
    String userId = _auth.currentUser!.uid;
    NoteModel noteModel = NoteModel(userId: userId, userNote: userNote);
    await _firebaseServices.createUserNote(noteModel);
  }

  //..............................................CREATING USER..................................
  Future<bool> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    try {
      if (password == confirmPassword) {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);
        String userId = userCredential.user!.uid;
        UserModel userModel =
            UserModel(name: name, email: email, userId: userId);
        _firebaseServices.createUser(userModel);
        return true;
      } else {
        print('password does not matched');
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  //.....................................................SIGNING IN THE USER ...............................
  Future<bool> signInTheUser(
    String email,
    String password,
  ) async {
    try {
      _firebaseServices.logInTheUser(email, password);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
  //..........................................................
}
