import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:split_it/core/models/base_model.dart';

class FirebaseRepository extends BaseModel {
  late FirebaseFirestore _firebaseFirestore;
  FirebaseRepository(String collection) : super(collection) {
    this._firebaseFirestore = FirebaseFirestore.instance;
  }
  Future create() async {
    try {
      final response =
          await _firebaseFirestore.collection(collenction).add(toMap!);
      return response.id;
    } catch (e) {
      throw e;
    }
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    try {
      final response = await _firebaseFirestore.collection(collenction).get();
      return response.docs.map((e) => e.data()).toList();
    } catch (e) {
      throw e;
    }
  }

  Future<List<Map<String, dynamic>>> where(
      {required field, required value}) async {
    try {
      final response = await _firebaseFirestore
          .collection(collenction)
          .where(field, isEqualTo: value)
          .get();
      return response.docs.map((e) => e.data()).toList();
    } catch (e) {
      throw e;
    }
  }

  Future<Map<String, dynamic>> firstWhere(
      {required doc, required field, required value}) async {
    try {
      final response = await _firebaseFirestore
          .collection(collenction)
          .where(field, isEqualTo: value)
          .get();
      return response.docs.first.data();
    } catch (e) {
      throw e;
    }
  }

  Future delete() async {}

  Future updae() {
    // TODO: implement updae
    throw UnimplementedError();
  }
}
