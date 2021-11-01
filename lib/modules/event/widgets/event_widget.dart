import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:split_it/core/text_style/app_text_style.dart';
import 'package:split_it/core/theme/theme_app.dart';
import 'package:split_it/modules/event/models/event_model.dart';

class EventWidget extends StatelessWidget {
  EventModel? eventModel;
  EventWidget({@required this.eventModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(eventModel!.imagePath!),
        Expanded(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  eventModel!.title!,
                  style: AppTextStyle.instance.titleEventTitle,
                ),
                subtitle:
                    Text(DateFormat('dd MMM').format(eventModel!.createdAt!)),
                trailing: Column(
                  children: [
                    Text(
                        'R\$ ${eventModel!.totalAmount!.toStringAsFixed(2).replaceAll('.', ',')}'),
                    Text(
                      '${eventModel!.people} amigo' +
                          '${eventModel!.people! > 1 ? 's' : ''}',
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
    );
  }
}
