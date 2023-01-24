class Product {
  late String _id;
  late String name;
  late String description;
  late String imagePath;
  late double price;
  late int quantity = 1;
  late List<Ingredient> ingredients;

  get id => _id;

  Product({
    required String id,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.name,
    required this.ingredients,
  }) {
    _id = id;
  }
}

class Ingredient {
  late String _id;
  late String name;
  late String icon;

  get id => _id;

  Ingredient({
    required String id,
    required this.name,
    required this.icon,
  }) {
    _id = id;
  }
}
