import 'package:flutter/material.dart';
import 'package:split_it/core/communs/formater.dart';
import 'package:split_it/core/models/user_model.dart';
import 'package:split_it/core/text_style/app_text_style.dart';
import 'package:split_it/core/theme/theme_app.dart';
import 'package:split_it/main.dart';
import 'package:split_it/modules/event/models/event_model.dart';

import '../../../core/routes/app_routers.dart';

class EventWidget extends StatelessWidget {
  final EventModel? eventModel;
  EventWidget({required this.eventModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(AppRouters.detailsEvent),
      child: Row(
        children: [
          eventModel!.organizer == getIt<UserModel>().id
              ? Image.asset('assets/images/dollar_cash_in.png')
              : Image.asset('assets/images/dollar_cash_out.png'),
          Expanded(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    eventModel!.title!,
                    style: AppTextStyle.instance.titleEventTitle,
                  ),
                  subtitle: Text(Formater.dateMMMMd(eventModel!.createdAt!)),
                  trailing: Column(
                    children: [
                      Text(Formater.currencyAmount(eventModel!.totalAmount!)),
                      Text(
                        '${eventModel!.totalFriends} amigo' +
                            '${eventModel!.totalFriends > 1 ? 's' : ''}',
                        style: AppTextStyle.instance.subTitleEventTitle,
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: ThemeApp.config.diviserColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
