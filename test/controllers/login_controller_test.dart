import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:split_it/modules/login/controllers/login_controller.dart';
import 'package:split_it/modules/login/models/login_state.dart';
import 'package:split_it/core/models/user_model.dart';
import 'package:split_it/modules/login/services/login_service.dart';

class LoginServiceMock extends Mock implements LoginService {
  @override
  Future<UserModel> googleSignIn() async {
    return UserModel(
      id: '123',
      displayName: 'Isaque',
      email: 'isaque@gmail.com',
      photoUrl: '',
    );
  }
}

void main() {
  late LoginController _loginController;
  late LoginService _loginService;
  setUp(() {
    _loginService = LoginServiceMock();
    _loginController = LoginController(_loginService);
  });

  test(
    "Testando o retorno do Google Sign com sucesso",
    () async {
      expect(_loginController.state, isInstanceOf<LoginStateEmpity>());
      await _loginController.googleSignIn().then((value) =>
          expect(_loginController.state, isInstanceOf<LoginStateSucess>()));
    },
  );

  test(
    'Teste return UserModel',
    () async {
      final user = await _loginController.googleSignIn();
      expect(
        user,
        isInstanceOf<UserModel>(),
      );
    },
  );
}
