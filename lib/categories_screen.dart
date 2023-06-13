import 'package:flutter/material.dart';
import './category.dart';
import './dummy_data.dart';
import './CategoryItem.dart';


class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
            children: DUMMY_CATEGORIES.map((catData) => CategoryItem(catData.id,catData.title, catData.color))
                .toList(),
            padding: EdgeInsets.all(20),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20));
  }
}
