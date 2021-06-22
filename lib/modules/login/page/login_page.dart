import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:split_it/core/theme/theme_app.dart';
import 'package:split_it/modules/widgets/social_media_widget.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarBrightness: Brightness.light));
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
                          child: Image.asset('assets/images/emoji.png'),
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
                SocialMediaWidget(
                  imagePath: 'assets/images/google.png',
                  title: 'Entrar com Google',
                ),
                SizedBox(height: 12),
                SocialMediaWidget(
                  imagePath: 'assets/images/apple.png',
                  title: 'Entrar com Apple',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
