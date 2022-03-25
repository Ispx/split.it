import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:shimmer/shimmer.dart';
import 'package:split_it/core/models/user_model.dart';
import 'package:split_it/core/theme/theme_app.dart';
import 'package:split_it/modules/home/controllers/balance_controller.dart';
import 'package:split_it/modules/home/controllers/events_controller.dart';
import 'package:split_it/modules/home/states/events_states.dart';
import 'package:split_it/modules/home/repositorys/home_repository.dart';
import 'components/appbar_home_widget.dart';
import 'components/event_list_widget.dart';

final EventsController eventscontroller = EventsController(HomeRepository());
late BalanceController balanceController = BalanceController(HomeRepository());

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage(this.user);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  initState() {
    balanceController.getBalance();
    eventscontroller.getEvents();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: ThemeApp.config.primaryColor));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeApp.config.background,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: CustomScrollView(
          slivers: [
            Observer(
              builder: (context) {
                return AppBarHomeWidget(
                  user: widget.user,
                  state: balanceController.state,
                  onTap: () {
                    Navigator.pushNamed(context, '/steps').then(
                      (value) {
                        SystemChrome.setSystemUIOverlayStyle(
                          SystemUiOverlayStyle(
                              statusBarColor: ThemeApp.config.primaryColor),
                        );
                      },
                    );
                  },
                );
              },
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
              ),
            ),
            Observer(
              builder: (context) {
                return SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  sliver: _builListByState(context),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _builListByState(BuildContext context) {
    switch (eventscontroller.state.runtimeType) {
      case EventsStateEmpity:
      case EventsStateLoading:
        return SliverList(
          delegate: SliverChildListDelegate(
            List.generate(
              6,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                ),
                child: SizedBox(
                  width: double.maxFinite,
                  height: 80,
                  child: Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.grey.shade300,
                    child: Container(
                      width: double.maxFinite,
                      height: 80,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ).toList(),
          ),
        );

      case EventsStateDone:
        return EventListWidget(
            (eventscontroller.state as EventsStateDone).events);
      case EventsStateError:
        return SliverToBoxAdapter(
          child: Center(
            child: Text((eventscontroller.state as EventsStateError).message),
          ),
        );
      default:
        return SliverToBoxAdapter(
          child: Center(
            child: Text('Estado da requisão não mapeado.'),
          ),
        );
    }
  }
}
