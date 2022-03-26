import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:split_it/core/models/user_model.dart';
import 'package:split_it/core/widgets/app_widget.dart';
import 'package:split_it/modules/home/controllers/balance_controller.dart';
import 'package:split_it/modules/home/controllers/events_controller.dart';
import 'package:split_it/modules/home/repositorys/home_repository.dart';

import 'modules/login/controllers/login_controller.dart';
import 'modules/login/services/google_sign_in_repository.dart';

GetIt getIt = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  getIt.registerSingleton<LoginController>(
      LoginController(GoogleSignInRepository()));
  getIt.registerSingleton<UserModel>(UserModel());
  getIt.registerSingleton<BalanceController>(
      BalanceController(HomeRepository()));
  getIt.registerSingleton<EventsController>(EventsController(HomeRepository()));
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container(
            child: Center(
              child: Text('Erro durante inicialização do Firebase'),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return AppWidget();
      },
    );
  }
}
