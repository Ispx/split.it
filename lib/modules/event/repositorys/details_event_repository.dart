import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:split_it/modules/event/models/event_model.dart';

class DetailsEventRepository {
  Future updatePaid(EventModel eventModel) async {
    var doc = await FirebaseFirestore.instance
        .collection('/events/')
        .where('organizer', isEqualTo: eventModel.organizer)
        .where('createdAt', isEqualTo: eventModel.createdAt)
        .get();

    String id = doc.docs.first.id;
    await FirebaseFirestore.instance
        .collection('/events/')
        .doc(id)
        .update(eventModel.toMap());
  }
}
