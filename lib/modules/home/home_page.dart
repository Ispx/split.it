import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:split_it/core/models/user_model.dart';
import 'package:split_it/core/theme/theme_app.dart';
import 'package:split_it/modules/home/controllers/balance_controller.dart';
import 'package:split_it/modules/home/controllers/events_controller.dart';
import 'package:split_it/modules/home/states/events_states.dart';
import 'package:split_it/modules/home/repositorys/home_repository.dart';
import 'components/appbar_home_widget.dart';
import 'components/event_list_widget.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage(this.user);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late EventsController _eventscontroller;
  late BalanceController _balanceController;
  initState() {
    _balanceController = BalanceController(HomeRepository(), onUpdate: () {
      setState(() {});
    });
    _eventscontroller = EventsController(HomeRepository(), onUpdate: () {
      setState(() {});
    });
    _balanceController.getBalance();
    _eventscontroller.getEvents();
    SystemUiOverlayStyle(statusBarColor: ThemeApp.config.primaryColor);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: ThemeApp.config.background),
    );
    return Scaffold(
      appBar: AppBarHomeWidget(widget.user, _balanceController.state, context),
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
              Expanded(child: _buildByState(context)),
            ],
          )),
    );
  }

  Widget _buildByState(BuildContext context) {
    switch (_eventscontroller.state.runtimeType) {
      case EventsStateEmpity:
      case EventsStateLoading:
        return Center(child: CircularProgressIndicator());
      case EventsStateDone:
        return EventListWidget(
            (_eventscontroller.state as EventsStateDone).events);
      case EventsStateError:
        return Center(
          child: Text((_eventscontroller.state as EventsStateError).message),
        );
      default:
        return Center(
          child: Text('Estado da requisão não mapeado.'),
        );
    }
  }
}
