import 'package:zakariae_marbre/data/Models/type_.dart';

abstract class ITypeRepo {
  Future<List<ArticleType>> getTypes();
  Future<ArticleType> getSingleType(id);
  void addType(ArticleType newType);
  void updateType(ArticleType oldType);
  void deleteType(id);
}
