class Product {
  final String? _id = null;
  final int idCategory;
  final String name;
  final String description;
  final String imagePath;
  final double price;
  int quantity = 1;
  final List<Ingredient> ingredients;

  get id => _id;

  Product({
    required String id,
    required this.idCategory,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.name,
    required this.ingredients,
  });
}

class Ingredient {
  final String? _id = null;
  final String name;
  final String icon;

  get id => _id;

  Ingredient({
    required String id,
    required this.name,
    required this.icon,
  });
}
