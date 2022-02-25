import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserModel {
  final String? displayName;
  String? firstName;
  final String? email;

  final String? id;

  final String? photoUrl;
  static UserModel singleton = UserModel();
  UserModel({this.id, this.displayName, this.email, this.photoUrl}) {
    firstName = displayName?.split(' ')[0];
  }
  google(GoogleSignInAccount signInAccount) {
    singleton = UserModel(
      id: signInAccount.id,
      displayName: signInAccount.displayName,
      email: signInAccount.email,
      photoUrl: signInAccount.photoUrl,
    );
  }

  apple(UserCredential userCredential) {
    singleton = UserModel(
      id: userCredential.user!.uid,
      displayName: userCredential.user!.displayName,
      email: userCredential.user!.email,
      photoUrl: userCredential.user!.photoURL,
    );
  }
}
