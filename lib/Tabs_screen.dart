import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favourite_screen.dart';
import './drawer.dart';
import './Meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> Favorites;

  TabsScreen(this.Favorites);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectPageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
   _pages = [
      {'page': CategoryScreen(), 'title': 'Categories'},
      {'page': FavouriteScreen(widget.Favorites), 'title': 'Your Favorites'}
    ];
    super.initState();
  }

  void _selectTab(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectPageIndex]['title']),
      ),
      drawer: DrawerScreen(),
      body: _pages[_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        backgroundColor: Theme.of(context).primaryColor,
        //  unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectPageIndex,

        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
