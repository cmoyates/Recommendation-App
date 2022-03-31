import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recommended_app/models/user.dart';
import 'package:recommended_app/provider/database_service.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  final db = DatabaseService();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken:  googleAuth.accessToken,
        idToken: googleAuth.idToken
      );
      await FirebaseAuth.instance.signInWithCredential(credential);

      final firebaseUser = FirebaseAuth.instance.currentUser;
      final userExists = await db.checkIfUserExists(firebaseUser!.uid);
      if (!userExists) {
        final user = UserObj(
          id: firebaseUser.uid, 
          name: firebaseUser.displayName!, 
          email: firebaseUser.email!, 
          imgUrl: firebaseUser.photoURL!,
          test: "testing"
        );
        await db.createUser(firebaseUser.uid, user.toJSON());
      }
    } catch (e) {
      print(e.toString());
    }

    notifyListeners();
  }

  Future logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}