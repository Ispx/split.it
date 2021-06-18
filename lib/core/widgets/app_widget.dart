import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:split_it/core/theme/theme_app.dart';
import 'package:split_it/modules/login/page/login_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle(statusBarColor: ThemeApp.config.primaryColor);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
