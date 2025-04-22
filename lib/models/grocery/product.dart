class GroceryProduct {
  String? title;
  String? image;

  GroceryProduct({this.title, this.image});

  GroceryProduct.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
  }
}
