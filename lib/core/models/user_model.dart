import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserModel {
  String? displayName;

  String? email;

  String? id;

  String? photoUrl;
  String? get firstName => displayName?.split(' ')[0];

  UserModel({this.id, this.displayName, this.email, this.photoUrl});
  google(GoogleSignInAccount signInAccount) {
    this.displayName = signInAccount.displayName;
    this.email = signInAccount.email;
    this.id = signInAccount.id;
    this.photoUrl = signInAccount.photoUrl;
  }

  apple(UserCredential userCredential) {
    copyWith(
      id: userCredential.user!.uid,
      displayName: userCredential.user!.displayName,
      email: userCredential.user!.email,
      photoUrl: userCredential.user!.photoURL,
    );
  }

  UserModel copyWith({
    String? displayName,
    String? firstName,
    String? email,
    String? id,
    String? photoUrl,
  }) {
    return UserModel(
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      id: id ?? this.id,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }


}
