import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:split_it/core/routes/app_routers.dart';
import 'package:split_it/core/theme/theme_app.dart';
import 'package:split_it/modules/error/error_page.dart';
import 'package:split_it/modules/home/event_details_page.dart';
import 'package:split_it/modules/home/home_page.dart';
import 'package:split_it/core/models/user_model.dart';
import 'package:split_it/modules/login/page/login_page.dart';
import 'package:split_it/modules/splash/pages/splash_page.dart';
import 'package:split_it/modules/steps/pages/created_split_splash_page.dart';
import 'package:split_it/modules/steps/pages/steps_page.dart';

import '../../modules/event/models/event_model.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting("pt_BR");
    SystemUiOverlayStyle(statusBarColor: ThemeApp.config.primaryColor);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        if (settings.name == AppRouters.home) {
          UserModel user = settings.arguments as UserModel;
          return MaterialPageRoute(
            builder: (context) => HomePage(user),
          );
        }
        if (settings.name == AppRouters.splashEventCreated) {
          final eventModel = settings.arguments as EventModel;
          return MaterialPageRoute(
            builder: (context) =>
                CreatedSplitSplashPage(eventModel: eventModel),
          );
        }
      },
      initialRoute: AppRouters.splashInittialize,
      routes: {
        AppRouters.splashInittialize: (context) => SplashPage(),
        AppRouters.login: (context) => LoginPage(),
        AppRouters.error: (context) => ErrorPage(),
        AppRouters.stepsCreateSplit: (context) => StepsPage(),
        AppRouters.detailsEvent: (context) => DetailsEventPage()
      },
    );
  }
}
