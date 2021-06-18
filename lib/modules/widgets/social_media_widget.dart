import 'package:flutter/material.dart';
import 'package:split_it/core/theme/theme_app.dart';

class SocialMediaWidget extends StatefulWidget {
  final String imagePath;
  final String title;
  SocialMediaWidget({this.imagePath = '', this.title = ''});

  createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMediaWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: MediaQuery.of(context).size.width * .8,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: ThemeApp.config.borderColor,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          widget.imagePath != ''
              ? Positioned(
                  left: 0,
                  child: Container(
                    width: 56,
                    height: 56,
                    child: Center(
                      child: Image.asset(widget.imagePath),
                    ),
                  ),
                )
              : Container(),
          Positioned(
            left: 56,
            child: Container(
              height: 56,
              width: 1,
              color: ThemeApp.config.borderColor,
            ),
          ),
          Text(
            widget.title,
          ),
        ],
      ),
    );
  }
}
