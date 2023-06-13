import 'package:flutter/material.dart';
import './drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routename = '/Filters';
  Function SaveFilters;
  Map<String,bool> currentFilters;

  FilterScreen(this.currentFilters,this.SaveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;
  bool _vegan = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  Widget Filters(String title, String subtitle, bool type, Function changes) {
    return SwitchListTile(
        title: Text(title),
        value: type,
        subtitle: Text(subtitle),
        onChanged: changes,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters'),
      actions: <Widget>[IconButton(onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                 'lactose': _lactoseFree,
                 'vegan': _vegan,
                 'vegetarian': _vegetarian};
              widget.SaveFilters(selectedFilters);
    }, icon: Icon((Icons.save)),
    ),
    ],
      ),
        drawer: DrawerScreen(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text('Adjust Your Meal Selection',
                  style: Theme.of(context).textTheme.headline6),
            ),
            Expanded(
                child: ListView(
              children: <Widget>[
                Filters('Gluten-free','Only include gluten-free meals.',_glutenFree,(newvalue) => setState(() {
                  _glutenFree = newvalue;
                }
                )),
                Filters('Lactose-free','Only include lactose-free meals.',_lactoseFree,(newvalue) => setState(() {
                  _lactoseFree = newvalue;
                }
                )),
                Filters('Vegetarian','Only include vegetarian meals.',_vegetarian,(newvalue) => setState(() {
                  _vegetarian = newvalue;
                }
                )),
                Filters('Vegan','Only include vegan meals.',_vegan,(newvalue) => setState(() {
                  _vegan = newvalue;
                }
                )),
              ],
            ))
          ],
        ));
  }
}
