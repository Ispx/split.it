import '../../../core/models/user_model.dart';

abstract class ILoginRepository {
  Future<UserModel> signIn();
  Future signOut();
}
