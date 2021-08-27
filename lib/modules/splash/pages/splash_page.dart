import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:split_it/core/theme/theme_app.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  double _currentOpacity = 1;
  late AnimationController _animationController = AnimationController(
    animationBehavior: AnimationBehavior.preserve,
    upperBound: 1.0,
    reverseDuration: Duration(seconds: 5),
    duration: Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  late Animation<double> _animation =
      Tween(begin: 0.0, end: 1.0).animate(_animationController);

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ThemeApp.config.background,
      ),
    );

    Future.delayed(Duration(milliseconds: 2200))
        .then((value) => Navigator.pushNamed(context, '/login'));

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
                  'assets/images/retangulo-dir.png',
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
                  'assets/images/retangulo-dir.png',
                  height: 58,
                ),
              ),
            ),
            Positioned(
              child: FadeTransition(
                opacity: _animation,
                child: AnimatedOpacity(
                  opacity: _currentOpacity,
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.bounceIn,
                  onEnd: () {
                    _currentOpacity = 1;
                  },
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 90,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              right: 20,
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  'assets/images/retangulo-esq.png',
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
                  'assets/images/retangulo-esq.png',
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
