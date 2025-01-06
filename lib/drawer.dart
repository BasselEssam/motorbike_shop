import 'package:final_project/AboutUs.dart';
import 'package:final_project/AccSettings.dart';
import 'package:final_project/cart_page.dart';
import 'package:final_project/favorites_page.dart';
import 'package:final_project/first.dart';
import 'package:final_project/maintenance_history_page.dart';
import 'package:final_project/orders_page.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            ListTile(leading: Icon(Icons.favorite),
            title: Text('Favorites'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FavoritesPage()));
              },
            ),
            ListTile(leading: Icon(Icons.account_circle),
              title: Text('Account'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AccSettings()));
              },
            ),
            ListTile(leading: Icon(Icons.shopping_bag_sharp),
              title: Text('Orders'),
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>OrdersPage()));},
            ),
            ListTile(leading: Icon(Icons.shopping_cart),
              title: Text('Cart'),
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));},
            ),
            ListTile(leading: Icon(Icons.miscellaneous_services),
              title: Text('Maintenance'),
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>MaintenanceHistory()));},
            ),
            ListTile(leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>First()));},
            ),
            ListTile(leading: Icon(Icons.info_outlined),
              title: Text('About Us'),
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUs()));},
            ),
          ],
        ),
      ),
    );
  }
}