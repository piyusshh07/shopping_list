

  import 'package:flutter/material.dart';

enum Categories{
  Vegetables ,
    Groceries ,
    Meat ,
    fruits ,
    Carbs ,
    Dairy,
    sweets,
    spices,
    convenience,
    hygiene,
    other }

  class Category{
   const Category(this.title,this.color);

  final String title;
  final Color color;
  }


