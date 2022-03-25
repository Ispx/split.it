import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:split_it/core/models/base_model.dart';

class UserModel extends BaseModel {
  String? displayName;

  String? email;

  String? id;

  String? photoUrl;
  String? get firstName => displayName?.split(' ')[0];

  UserModel({this.id, this.displayName, this.email, this.photoUrl})
      : super(collenction: '/users/');
  factory UserModel.google(GoogleSignInAccount signInAccount) => UserModel(
        id: signInAccount.id,
        email: signInAccount.email,
        displayName: signInAccount.displayName,
        photoUrl: signInAccount.photoUrl,
      );

  factory UserModel.apple(UserCredential userCredential) => UserModel(
        id: userCredential.user!.uid,
        displayName: userCredential.user!.displayName,
        email: userCredential.user!.email,
        photoUrl: userCredential.user!.photoURL,
      );

  factory UserModel.froMap(Map map) => UserModel(
        id: map['id'],
        displayName: map['display_name'],
        photoUrl: map['photo_url'],
        email: map['email'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'display_name': this.displayName,
      'email': this.email,
      'photo_url': photoUrl
    };
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

  String get lastName => displayName!.split(' ').sublist(1).join();
  bool isEquals(UserModel userModel) => this.id == userModel.id;
}
