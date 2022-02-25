import 'package:google_sign_in/google_sign_in.dart';
import 'package:split_it/core/models/user_model.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'dart:convert';
import 'dart:math';

import '../../../main.dart';

abstract class LoginService {
  Future<UserModel> googleSignIn();
  Future<UserModel> signInWithApple();
}

class LoginServiceImp implements LoginService {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
    'email',
  ]);
  @override
  Future<UserModel> googleSignIn() async {
    try {
      var signInAccount = await _googleSignIn.signIn();
      UserModel user = getIt<UserModel>();
      user.google(signInAccount!);
      return user;
    } catch (e) {
      throw 'Falha durante autenticação com Google.';
    }
  }

  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<UserModel> signInWithApple() async {
    try {
      // To prevent replay attacks with the credential returned from Apple, we
      // include a nonce in the credential request. When signing in with
      // Firebase, the nonce in the id token returned by Apple, is expected to
      // match the sha256 hash of `rawNonce`.
      final rawNonce = generateNonce();
      final nonce = sha256ofString(rawNonce);

      // Request credential for the currently signed in Apple account.
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      // Create an `OAuthCredential` from the credential returned by Apple.
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      // Sign in the user with Firebase. If the nonce we generated earlier does
      // not match the nonce in `appleCredential.identityToken`, sign in will fail.

      final credential =
          await FirebaseAuth.instance.signInWithCredential(oauthCredential);
      return getIt<UserModel>().apple(credential);
    } catch (e) {
      throw 'Falha durante autenticação com a apple.';
    }
  }
}
