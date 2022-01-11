
class Production {
  int id;
  String title;
  String subTitle;
  String name;
  String price;
  bool isFavorite = false;

  static final columns = ["id", "title", "subTitle", "name", "price", "isFavorite"];

  Production(this.id, this.title, this.subTitle, this.name, this.price);

  Production.createJs(this.id, this.title, this.subTitle, this.name, this.price, this.isFavorite);

  void updateFavorite() {
    this.isFavorite = !this.isFavorite;
  }

  factory Production.fromJson(Map<dynamic, dynamic> parsedJson) {
    return Production.createJs(
        parsedJson['id'],
        parsedJson['title'],
        parsedJson['subTitle'],
        parsedJson['name'],
        parsedJson['price'],
        parsedJson['isFavorite'] == 1 ? true : false
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title.toString(),
    'subTitle': subTitle.toString(),
    'name': name.toString(),
    'price': price.toString(),
    'isFavorite': isFavorite ? 1 : 2
  };
}