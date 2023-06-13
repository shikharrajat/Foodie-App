import 'package:flutter/material.dart';
import './category.dart';
import './category_meal_screen.dart';
import './meal_item.dart';

class CategoryItem extends StatelessWidget {
  final String Title;
  final Color color;
  final String id;

  CategoryItem(this.id,this.Title, this.color);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMeals.routename,
      arguments: {
        'id': id,
        'title': Title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(Title, style: Theme.of(context).textTheme.headline6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
      ),
    );
  }
}
