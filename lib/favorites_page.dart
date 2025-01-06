import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'drawer.dart';

class FavoritesPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "Favorites",
          style: GoogleFonts.aBeeZee(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection('favorites').get(),
          builder: (context, snapshot) {
            if (snapshot.hasData == false) {
              return CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return FavoriteItem(
                      snapshot.data!.docs[index]['parent'],
                      snapshot.data!.docs[index]['id'],
                      snapshot.data!.docs[index].id);
                },
                itemCount: snapshot.data!.docs.length,
              );
            }
          }),
      drawer: DrawerPage(),
    );
  }
}
