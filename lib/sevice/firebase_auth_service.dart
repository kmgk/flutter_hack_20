import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hack20/model/user.dart';
import 'package:flutter_hack20/sevice/firestore_service.dart';

class FirebaseAuthService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final FirebaseAuthService instance = FirebaseAuthService();

  Future<void> signInAnonymously(String name) async {
    final AuthResult result = await _firebaseAuth.signInAnonymously();
    await FirestoreService.instance.createUser(
      User.initialized(result.user.uid, name),
    );
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}
