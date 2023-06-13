import 'package:flutter/material.dart';
import 'package:foodie_app/dummy_data.dart';
import './meal_item.dart';
import './Meal.dart';

class CategoryMeals extends StatefulWidget {

  static const routename = '/Category-Meals';
final List<Meal> AvailableMeals;

CategoryMeals(this.AvailableMeals);

  @override
  State<CategoryMeals> createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String CategoryTitle;
  List<Meal> displayedMeals;
 bool _loadedInitData = false;
  @override
  void initState() {
    // ...
    super.initState();
  }
  @override

  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if(!_loadedInitData){
    final RouteArgs = ModalRoute
        .of(context)
        .settings
        .arguments as Map<String,String>;
   CategoryTitle = RouteArgs['title'];
    final CategoryId = RouteArgs['id'];
     displayedMeals = widget.AvailableMeals.where((meal) {
      return meal.categories.contains(CategoryId);
    }).toList();
    _loadedInitData=true; }
    super.didChangeDependencies();
  }
  void Remove_Meal(String MealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id  == MealId);
    });
  }

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(CategoryTitle),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
    return    MealItem(
      id: displayedMeals[index].id,
      title: displayedMeals[index].title,
      imageUrl: displayedMeals[index].imageUrl,
      duration: displayedMeals[index].duration,
      affordability: displayedMeals[index].affordability,
      complexity: displayedMeals[index].complexity,

    );
    }, itemCount: displayedMeals.length,
      ),);
  }
}


