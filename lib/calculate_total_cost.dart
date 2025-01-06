import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CalculateTotalCost extends StatelessWidget{
  dynamic totalPrice=0;

  @override
  Widget build(BuildContext context) {
      return FutureBuilder( future: FirebaseFirestore.instance.collection('cart').get(),
          builder: (context,snapshot){
            if(snapshot.hasData==false){
              return CircularProgressIndicator();
            }
            else {
              for (int i = 0; i < snapshot.data!.docs.length; i++) {
                totalPrice= totalPrice+ snapshot.data!.docs[i]['total price'];
              }
              return Text(totalPrice.toString());
            }
          }
          );
    }
  }