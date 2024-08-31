// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:zakariae_marbre/data/Models/article_.dart';

class ArticlesRepo {
  FirebaseFirestore db;
  ArticlesRepo({
    required this.db,
  });
  Future<List<Article>> getArticles() async {
    final cc = await db.collection("articles").get();
    List<Article> allarticles = [];
    for (var element in cc.docs) {
      allarticles.add(Article.fromJson(element.data()));
    }
    return allarticles;
  }

  Future<Article> getSingleArticle(id) async {
    final docRef = await db.collection("articles").doc(id).get();
    return Article.fromJson(docRef.data()!);
  }

  void addArticle(Article newAricle) {
    db
        .collection("articles")
        .add(newAricle.toJson())
        .then((value) => debugPrint(value.toString()));
  }

  void updateArticle(Article oldArticle) {
    db
        .collection("articles")
        .doc(oldArticle.articleId)
        .set(oldArticle.toJson())
        .onError((e, _) => debugPrint("Error writing document: $e"));
  }

  void deleteArticle(id) {
    db.collection("articles").doc(id).delete().then(
          (doc) => debugPrint("Document deleted"),
          onError: (e) => debugPrint("Error updating document $e"),
        );
  }
}
