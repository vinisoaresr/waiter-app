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
      idCategory: 1,
      name: 'Pizza quatro queijos',
      description: 'Deliciosa pizza quatro queijos com borda simples',
      imagePath: 'quatro-queijos.png',
      price: 54.69,
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
      idCategory: 2,
      name: 'Coca cola',
      description: 'Coca cola lata geladinha topzera',
      imagePath: 'coca-cola.png',
      price: 5.99,
      ingredients: [],
    ),
    Product(
      id: "3",
      idCategory: 2,
      name: 'Brigadeiro',
      description: 'Brigadeiro de caneca ',
      imagePath: 'brigadeiro.jpeg',
      price: 12.99,
      ingredients: [],
    ),
    Product(
      id: "3",
      idCategory: 3,
      name: 'Coca cola 2L',
      description: 'Coca cola garrafa 2L',
      imagePath: 'coca-cola.png',
      price: 11.59,
      ingredients: [],
    ),
  ];
}
