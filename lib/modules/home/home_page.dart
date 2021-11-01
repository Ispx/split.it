import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:split_it/core/models/user_model.dart';
import 'package:split_it/core/theme/theme_app.dart';
import 'package:split_it/modules/home/controllers/balance_controller.dart';
import 'package:split_it/modules/home/controllers/home_controller.dart';
import 'package:split_it/modules/home/states/home_states.dart';
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
  late HomeController _controller;
  late BalanceController _balanceController;
  initState() {
    _balanceController = BalanceController(HomeRepository(), onUpdate: () {
      setState(() {});
    });
    _controller = HomeController(HomeRepository(), onUpdate: () {
      setState(() {});
    });
    _balanceController.getBalance();
    _controller.getEvents();
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
    switch (_controller.state.runtimeType) {
      case HomeStateEmpity:
      case HomeStateLoading:
        return Center(child: CircularProgressIndicator());
      case HomeStateDone:
        return EventListWidget((_controller.state as HomeStateDone).events);
      case HomeStateError:
        return Center(
          child: Text((_controller.state as HomeStateError).message),
        );
      default:
        return Center(
          child: Text('Estado da requisão não mapeado.'),
        );
    }
  }
}
