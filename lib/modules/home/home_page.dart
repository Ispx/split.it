import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:split_it/core/models/user_model.dart';
import 'package:split_it/core/theme/theme_app.dart';

import 'components/appbar_home_widget.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage(this.user);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: ThemeApp.config.background),
    );
    return Scaffold(
      appBar: AppBarHomeWidget(widget.user, context),
      body: Container(),
    );
  }
}
