import 'package:flutter/material.dart';
import 'package:split_it/modules/login/models/user_model.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage(this.user);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Image.network(widget.user.photoUrl!),
        ),
      ),
      body: Container(),
    );
  }
}
