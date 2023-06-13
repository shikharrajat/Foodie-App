import 'package:flutter/material.dart';
import 'package:foodie_app/category_meal_screen.dart';
import 'package:foodie_app/favourite_screen.dart';
import 'package:foodie_app/meal_detail.dart';
import './categories_screen.dart';
import './Tabs_screen.dart';
import './Filters_Screen.dart';
import './dummy_data.dart';
import './Meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> Available_Meals = DUMMY_MEALS;
  List<Meal> Favorite_Meals = [];

  void _setFilters(Map<String, bool> filterData) {
    print(filterData['gluten']);
    print(filterData['lactose']);
    print(filterData['vegan']);
    setState(() {
      _filters = filterData;

      Available_Meals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        Favorite_Meals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        Favorite_Meals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        Favorite_Meals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool IsMealFavorite(String MealId) {
    return Favorite_Meals.any((meal) => meal.id == MealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
      // home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(Favorite_Meals),
        CategoryMeals.routename: (ctx) => CategoryMeals(Available_Meals),
        MealDetails.routename: (ctx) =>
            MealDetails(_toggleFavorite, IsMealFavorite),
        FilterScreen.routename: (ctx) => FilterScreen(_filters, _setFilters),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoryScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoryScreen());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
