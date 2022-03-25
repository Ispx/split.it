import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:split_it/modules/event/models/event_model.dart';

import '../../../main.dart';
import '../../home/controllers/events_controller.dart';

class DetailsEventRepository {
  Future updateEvent(EventModel eventModel) async {
    var doc = await FirebaseFirestore.instance
        .collection('/events/')
        .where('organizer', isEqualTo: eventModel.organizer)
        .where('createdAt', isEqualTo: eventModel.createdAt)
        .get();

    await FirebaseFirestore.instance
        .collection('/events/')
        .doc(doc.docs.first.id)
        .update(eventModel.toMap());
    await getIt<EventsController>().getEvents();
  }

  Future delete(EventModel eventModel) async {
    var doc = await FirebaseFirestore.instance
        .collection('/events/')
        .where('organizer', isEqualTo: eventModel.organizer)
        .where('createdAt', isEqualTo: eventModel.createdAt)
        .get();

    await FirebaseFirestore.instance
        .collection('/events/')
        .doc(doc.docs.first.id)
        .delete();
    await getIt<EventsController>().getEvents();
  }
}
