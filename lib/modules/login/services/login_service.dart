import 'package:google_sign_in/google_sign_in.dart';
import 'package:split_it/core/models/user_model.dart';

abstract class LoginService {
  Future<UserModel> googleSignIn();
}

class LoginServiceImp implements LoginService {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
    'email',
  ]);
  @override
  Future<UserModel> googleSignIn() async {
    try{    var signInAccount = await _googleSignIn.signIn();
    return UserModel.google(signInAccount!);
    }catch(e){
      throw e.toString();
    }
  }
}
