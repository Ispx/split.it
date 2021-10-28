import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:split_it/core/models/user_model.dart';
import 'package:split_it/core/theme/theme_app.dart';
import 'package:split_it/modules/event/controller/event_controller.dart';
import 'package:split_it/modules/event/widgets/event_widget.dart';

import 'components/appbar_home_widget.dart';
import 'components/event_list_widget.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage(this.user);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  EventController _eventController = EventController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: ThemeApp.config.background),
    );
    return Scaffold(
      appBar: AppBarHomeWidget(widget.user, context),
      body: Container(
          padding:
              EdgeInsets.symmetric(horizontal: ThemeApp.config.padding * 6),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: 90,
              ),
              Expanded(child: EventListWidget(_eventController.events)),
            ],
          )),
    );
  }
}
