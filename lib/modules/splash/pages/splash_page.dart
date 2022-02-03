import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:split_it/core/images/images_app.dart';
import 'package:split_it/core/theme/theme_app.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationOpacity;
  initState() {
    _animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    _animationOpacity = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.ease));
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ThemeApp.config.background,
      ),
    );
    _animationController.forward();
    //_animationController.addListener(() {setState})
    Future.delayed(Duration(milliseconds: 2200))
        .then((value) => Navigator.pushReplacementNamed(context, '/login'));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: ThemeApp.config.background,
          gradient: ThemeApp.config.linearGradient,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 120,
              left: 20,
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  ImagesApp.retangulo_dir,
                  height: 98,
                ),
              ),
            ),
            Positioned(
              top: 250,
              left: 20,
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  ImagesApp.retangulo_dir,
                  height: 58,
                ),
              ),
            ),
            Positioned(
              child: FadeTransition(
                opacity: _animationOpacity,
                child: Image.asset(
                  ImagesApp.logo,
                  height: 90,
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              right: 20,
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  ImagesApp.retangulo_esq,
                  height: 98,
                ),
              ),
            ),
            Positioned(
              bottom: 250,
              right: 20,
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  ImagesApp.retangulo_esq,
                  height: 58,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
