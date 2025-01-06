import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteItem extends StatelessWidget{
  dynamic productParent;
  dynamic productId;
  dynamic favoritesId;

  FavoriteItem(this.productParent,this.productId,this.favoritesId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('brands').doc('sCyCK3WPVlzvnIaMNBVs').collection(productParent).doc(productId).get(),
    builder: (context, snapshot) {
    if(snapshot.hasData==false){
    return CircularProgressIndicator();
    }
    else {
      return Row(
        children: [
          Column(children: [
            Image.network(snapshot.data!["image"],width: 100,height: 100,),
          ],),
          Padding(padding: EdgeInsets.only(right: 15)),
          Column(children: [
            Padding(padding: EdgeInsets.only(left: 15)),
            Text(snapshot.data!["name"],style: GoogleFonts.aBeeZee(textStyle:TextStyle(color: Colors.black),fontSize: 15),),
          ],),
          Expanded(child: SizedBox()),
          FavoriteButton(
              isFavorite: true,
              valueChanged: (isFavorite){
                isFavorite==false?FirebaseFirestore.instance.collection("favorites").doc(favoritesId)
                    .delete()
                    :null;
              })
        ],
      );
    }
    }
    );
  }
}