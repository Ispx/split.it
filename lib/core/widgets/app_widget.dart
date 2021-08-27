import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:split_it/core/theme/theme_app.dart';
import 'package:split_it/modules/error/error_page.dart';
import 'package:split_it/modules/home/home_page.dart';
import 'package:split_it/modules/login/models/user_model.dart';
import 'package:split_it/modules/login/page/login_page.dart';
import 'package:split_it/modules/splash/pages/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle(statusBarColor: ThemeApp.config.primaryColor);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        if (settings.name == '/home/') {
          UserModel user = settings.arguments as UserModel;
          return MaterialPageRoute(builder: (context) => HomePage(user));
        }
      },
      initialRoute: '/',
      routes: {
        '/': (context) => SplashPage(),
        '/login': (context) => LoginPage(),
        '/error': (context) => ErrorPage(),
      },
    );
  }
}
