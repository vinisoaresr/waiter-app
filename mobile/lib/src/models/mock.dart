import 'package:waiter_app/src/models/category.dart';
import 'package:waiter_app/src/models/product.dart';

class Mock {
  static List<Category> categories = [
    Category(
      id: "1",
      name: 'Pizza',
      icon: '🍕',
    ),
    Category(
      id: "2",
      name: 'Bebidas',
      icon: '🍻',
    ),
    Category(
      id: "3",
      name: 'Burgers',
      icon: '🍔',
    ),
    Category(
      id: "4",
      name: 'Promoções',
      icon: '🏷',
    ),
  ];

  static List<Product> products = [
    Product(
      id: "1",
      name: 'Pizza quatro queijos',
      description: 'Deliciosa pizza quatro queijos com borda simples',
      imagePath: 'quatro-queijos.png',
      price: 40.0,
      ingredients: [
        Ingredient(
          id: "1",
          name: 'Mussarela',
          icon: '🧀',
        ),
        Ingredient(
          id: "2",
          name: 'Parmesão',
          icon: '🧀',
        ),
        Ingredient(
          id: "3",
          name: 'Gouda',
          icon: '🧀',
        ),
        Ingredient(
          id: "4",
          name: 'Brie',
          icon: '🧀',
        ),
      ],
    ),
    Product(
      id: "2",
      name: 'Coca cola',
      description: 'Coca cola lata geladinha topzera',
      imagePath: 'coca-cola.png',
      price: 7,
      ingredients: [],
    )
  ];
}
