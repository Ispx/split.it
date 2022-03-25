import 'package:google_sign_in/google_sign_in.dart';
import 'package:split_it/core/models/user_model.dart';
import 'package:split_it/modules/login/interface/ilogin_repository.dart';

class GoogleSignInRepository implements ILoginRepository {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
    'email',
  ]);
  @override
  Future<UserModel> signIn() async {
    try {
      var signInAccount = await _googleSignIn.signIn();
      return UserModel.google(signInAccount!);
    } catch (e) {
      throw 'Falha durante autenticação com Google.';
    }
  }

  @override
  Future signOut() async {
    await _googleSignIn.signOut();
  }
}
