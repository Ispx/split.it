import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:split_it/core/models/user_model.dart';
import 'package:split_it/modules/login/controllers/login_controller.dart';
import 'package:split_it/modules/login/interface/ilogin_repository.dart';
import 'package:split_it/modules/login/models/login_state.dart';

class LoginGoogleSignInMock extends Mock implements ILoginRepository {
  UserModel? authModel;
  @override
  Future<UserModel> signIn() async {
    authModel = UserModel(
      id: '123',
      displayName: 'Isaque',
      email: 'isaque@gmail.com',
      photoUrl: '',
    );
    return authModel!;
  }

  @override
  Future signOut() async {
    authModel = null;
  }
}

void main() {
  late LoginController _loginController;
  late ILoginRepository _loginRepository;
  setUp(() {
    _loginRepository = LoginGoogleSignInMock();
    _loginController = LoginController(_loginRepository);
  });

  test(
    "Testando o retorno do Google Sign com sucesso",
    () async {
      expect(_loginController.state, isInstanceOf<LoginStateEmpity>());
      await _loginController.signIn().then((value) =>
          expect(_loginController.state, isInstanceOf<LoginStateSucess>()));
    },
  );

  test(
    'Teste return AuthModel',
    () async {
      final user = await _loginController.signIn();
      expect(
        user,
        isInstanceOf<UserModel>(),
      );
    },
  );
}
