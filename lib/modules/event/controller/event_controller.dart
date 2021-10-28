import 'package:split_it/core/images/images_app.dart';
import 'package:split_it/modules/event/models/event_model.dart';

class EventController {
  final events = <EventModel>[
    EventModel(
        title: 'Churrasco na laje',
        imagePath: ImagesApp.dollarCahOut,
        createdAt: DateTime.now(),
        totalAmount: 100.50,
        people: 5),
    EventModel(
        title: 'Rolê no shopping',
        imagePath: ImagesApp.dollarCahOut,
        createdAt: DateTime.now(),
        totalAmount: 100.50,
        people: 5),
  ];
}
