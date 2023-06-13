import 'package:flutter/material.dart';
import './Meal.dart';
import './meal_item.dart';

class FavouriteScreen extends StatelessWidget {
final List<Meal> Favorites;

FavouriteScreen(this.Favorites);

  @override
  Widget build(BuildContext context) {
    if(Favorites.isEmpty){
      return Center(child: Text('You have no Favorites - start adding some!'));
    }
    return ListView.builder(itemBuilder: (context, index) {
      return    MealItem(
        id: Favorites[index].id,
        title: Favorites[index].title,
        imageUrl:Favorites[index].imageUrl,
        duration: Favorites[index].duration,
        affordability: Favorites[index].affordability,
        complexity:Favorites[index].complexity,

      );
    }, itemCount: Favorites.length,
    );

  }
}
