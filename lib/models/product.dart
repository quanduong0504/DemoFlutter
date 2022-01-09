
class Production {
  int id;
  String title;
  String subTitle;
  String name;
  String price;
  bool isFavorite = false;

  Production(this.id, this.title, this.subTitle, this.name, this.price);

  void updateFavorite() {
    this.isFavorite = !this.isFavorite;
  }
}