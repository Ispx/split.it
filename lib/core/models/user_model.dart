import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserModel {
  final String? displayName;
  String? firstName;
  final String? email;

  final String? id;

  final String? photoUrl;

  UserModel(
      {@required this.id,
      @required this.displayName,
      @required this.email,
      @required this.photoUrl}) {
    firstName = displayName?.split(' ')[0];
  }

  factory UserModel.google(GoogleSignInAccount signInAccount) => UserModel(
        id: signInAccount.id,
        displayName: signInAccount.displayName,
        email: signInAccount.email,
        photoUrl: signInAccount.photoUrl,
      );
}
