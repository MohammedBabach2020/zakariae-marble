// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:zakariae_marbre/data/Models/type_.dart';
import 'package:zakariae_marbre/data/Repository/type_repo_interface.dart';

class TypeRepo implements ITypeRepo {
  FirebaseFirestore db;
  TypeRepo({
    required this.db,
  });

  @override
  Future<ArticleType> getSingleType(id) async {
    final docRef = await db.collection("types").doc(id).get();
    Map<String, dynamic>? data = docRef.data();
    final addId = <String, dynamic>{"id": docRef.id};
    data?.addEntries(addId.entries);
    return ArticleType.fromMap(data!);
  }

  @override
  Future<List<ArticleType>> getTypes() async {
    final types = await db.collection("types").get();
    List<ArticleType> allarticles = [];
    for (var element in types.docs) {
      Map<String, dynamic>? data = element.data();
      final addId = <String, dynamic>{"id": element.id};
      data.addEntries(addId.entries);
      allarticles.add(ArticleType.fromMap(data));
    }
    return allarticles;
  }

  @override
  void addType(ArticleType newType) {
    db
        .collection("types")
        .add(newType.toMap())
        .then((value) => debugPrint(value.toString()));
  }

  @override
  void deleteType(id) {
    db.collection("types").doc(id).delete().then(
          (doc) => debugPrint("Document deleted"),
          onError: (e) => debugPrint("Error updating document $e"),
        );
  }

  @override
  void updateType(ArticleType oldType) {
    db
        .collection("types")
        .doc(oldType.id)
        .set(oldType.toMap())
        .onError((e, _) => debugPrint("Error writing document: $e"));
  }
}
