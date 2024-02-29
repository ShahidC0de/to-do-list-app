import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/models/user_model.dart';

class FirebaseServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

  Future<void> logInTheUser(
    String email,
    String password,
  ) async {
    try {
      _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (_) {}
  }
}
