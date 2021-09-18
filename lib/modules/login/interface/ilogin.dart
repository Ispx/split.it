import 'package:split_it/modules/login/models/login_state.dart';
import 'package:split_it/core/models/user_model.dart';

abstract class ILogin {
  Future<UserModel> googleSignIn();
}
