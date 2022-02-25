import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:split_it/core/images/images_app.dart';
import 'package:split_it/core/theme/theme_app.dart';
import 'package:split_it/modules/login/controllers/login_controller.dart';
import 'package:split_it/modules/login/models/login_state.dart';
import 'package:split_it/modules/login/services/login_service.dart';
import 'package:split_it/modules/widgets/social_media_widget.dart';

import '../../../core/models/user_model.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller;

  initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarBrightness: Brightness.light));
    controller = LoginController(LoginServiceImp());
    autorun(
      (_) {
        if (controller.state is LoginStateSucess) {
          final user = (controller.state as LoginStateSucess).user;
          Navigator.pushNamedAndRemoveUntil(context, '/home/', (route) => false,
              arguments: UserModel.singleton);
        } else if (controller.state is LoginStateFailure) {
          Future.delayed(Duration(milliseconds: 500)).then(
            (value) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(controller.state.toString()),
              ),
            ),
          );
        }
      },
    );

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 40),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 250,
              child: Text(
                'Divida suas contas com seus amigos',
                textAlign: TextAlign.left,
                style: GoogleFonts.montserrat(
                  fontSize: 40,
                  color: ThemeApp.config.titleColor,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(),
                Container(
                  height: 56,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        child: Center(
                          child: Image.asset(ImagesApp.emojio),
                        ),
                      ),
                      Text(
                        'Faça seu login com\numa das contas abaixo',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Observer(
                  builder: (context) {
                    if (controller.state == LoginStateLoading())
                      return CircularProgressIndicator();
                    return SocialMediaWidget(
                      imagePath: ImagesApp.google,
                      title: 'Entrar com Google',
                      onTap: () async {
                        await controller.googleSignIn();
                      },
                    );
                  },
                ),
                SizedBox(height: 12),
                Platform.isIOS
                    ? SocialMediaWidget(
                        imagePath: ImagesApp.apple,
                        title: 'Entrar com Apple',
                        onTap: () async {
                          await controller.signInWithApple();
                        },
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
