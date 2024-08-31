// ignore_for_file: public_member_api_docs, sort_constructors_first
class Article {
  String? articleId, type, name, size;
  double? buyingPrice, sellingPrice, quantity;

  Article({
    required this.articleId,
    required this.type,
    required this.name,
    required this.size,
    required this.quantity,
    required this.buyingPrice,
    required this.sellingPrice,
  });

  Article.fromJson(Map<String, dynamic> json) {
    articleId = json["articleId"];
    type = json["type"];
    name = json["name"];
    size = json["size"];
    quantity = json["quantity"];
    buyingPrice = json["buyingPrice"];
    sellingPrice = json["sellingPrice"];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'size': size,
      'quantity': quantity,
      'buyingPrice': buyingPrice,
      'sellingPrice': sellingPrice
    };
  }
}
