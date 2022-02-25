import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:split_it/core/models/base_model.dart';

class FirebaseRepository {
  static Future create<T extends BaseModel>(T data) async {
    try {
      final response = await FirebaseFirestore.instance
          .collection(data.collenction!)
          .add(data.toMap());
      return response.id;
    } catch (e) {
      throw e;
    }
  }

  static Future<List<Map<String, dynamic>>?> getAll(String collecion) async {
    try {
      final response =
          await FirebaseFirestore.instance.collection(collecion).get();
      return response.docs.map((e) => e.data()).toList();
    } catch (e) {
      throw e;
    }
  }

  static Future<List<Map<String, dynamic>>> where(String collection,
      {required field, required value}) async {
    try {
      final response = await FirebaseFirestore.instance
          .collection(collection)
          .where(field, isEqualTo: value)
          .get();
      return response.docs.map((e) => e.data()).toList();
    } catch (e) {
      throw e;
    }
  }

  static Future<Map<String, dynamic>> firstWhere(String collection,
      {required doc, required field, required value}) async {
    try {
      final response = await FirebaseFirestore.instance
          .collection(collection)
          .where(field, isEqualTo: value)
          .get();
      return response.docs.first.data();
    } catch (e) {
      throw e;
    }
  }

  static Future delete() async {}

  static Future updae() {
    // TODO: implement updae
    throw UnimplementedError();
  }
}
