import 'package:flutter/material.dart';
import './meal_item.dart';
import './dummy_data.dart';

class MealDetails extends StatelessWidget {
  static const routename = '/meal-detail';
  Function toggleFavorite;
  Function IsMealFavorite;

  MealDetails(this.toggleFavorite,this.IsMealFavorite);

  Widget buildSelectionTitle(BuildContext ctx, String Title) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(Title, style: Theme.of(ctx).textTheme.headline6));
  }

  Widget buildContainer(BuildContext ctx, Widget child) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final MealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == MealId);

    return Scaffold(
      appBar: AppBar(title: Text('${selectedMeal.title}')),
      // curly braises is used because it is Thoda complex equation
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                )),
            buildSelectionTitle(context, 'ingredients'),
            buildContainer(
              context,
              ListView.builder(
                itemBuilder: (context, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(selectedMeal.ingredients[index]))),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSelectionTitle(context, 'Steps'),
            buildContainer(
              context,
              ListView.builder(
                  itemBuilder: (context, index) => Column(children: [
                        ListTile(
                          leading: CircleAvatar(child: Text('# ${index + 1}')),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        Divider()
                      ]),
                  itemCount: selectedMeal.steps.length),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(IsMealFavorite(MealId) ?  Icons.star: Icons.star_border,),
        onPressed: () => toggleFavorite(MealId),
      ),
    );
  }
}
