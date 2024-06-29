import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/models/groceryitem.dart';


final groceryItems=[
  GroceryItem(
    id:"a",
  name: 'Milk',
  quantity: 1,
  category: categories[Categories.Dairy]!),
  GroceryItem(
      id: 'b',
      name: 'Bananas',
      quantity: 5,
      category: categories[Categories.fruits]!),
  GroceryItem(
      id: 'c',
      name: 'Beef Steak',
      quantity: 1,
      category: categories[Categories.Meat]!),
];