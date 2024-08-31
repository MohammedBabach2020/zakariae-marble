// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ArticleType {
  String? id, type;
  ArticleType({
    this.id,
    this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
    };
  }

  factory ArticleType.fromMap(Map<String, dynamic> map) {
    return ArticleType(
      id: map['id'] != null ? map['id'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleType.fromJson(String source) =>
      ArticleType.fromMap(json.decode(source) as Map<String, dynamic>);
}
