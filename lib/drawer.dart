import 'package:flutter/material.dart';
import './Filters_Screen.dart';

 class DrawerScreen extends StatelessWidget {

   Widget buildList(String title, IconData icon, Function func) {
     return ListTile(leading: Icon(icon, size: 16),
       title: Text(title, style: TextStyle(fontSize: 24,
           fontWeight: FontWeight.bold,
           fontFamily: 'Robotoondensed')),
       onTap: func,
     );
   }


   @override
   Widget build(BuildContext context) {
     return Drawer(
         child: Column(children: <Widget>[
           Container(height: 120,
               width: double.infinity,
               padding: EdgeInsets.all(20),
               alignment: Alignment.centerLeft,
             color: Theme.of(context).accentColor,
               child: Text('Cooking UP!', style: TextStyle(
                   fontWeight: FontWeight.w900, fontSize: 30, color: Theme
                   .of(context)
                   .primaryColor))),
           SizedBox(height: 20,),
           buildList('Meals', Icons.restaurant, () {
             Navigator.of(context).pushReplacementNamed('/');
           }),
           ListTile(leading: Icon(Icons.settings, size: 16),
             title: Text('Filters', style: TextStyle(fontSize: 24,
                 fontWeight: FontWeight.bold,
                 fontFamily: 'Robotoondensed')),
             onTap: () {
             Navigator.of(context).pushReplacementNamed(FilterScreen.routename);
             },),

         ],));
   }
 }
