import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_project/order_item.dart';

class OrdersPage extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title:
          Container(child:
          Text("Your Orders",style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
        ),
        body:FutureBuilder(
          future: FirebaseFirestore.instance.collection('orders').get(),
          builder: (context, snapshot) {
            if (snapshot.hasData==false){
              return CircularProgressIndicator();
            }
            else {
              return Container(
                color: Colors.white,
                child:
                ListView.builder(
                    itemBuilder: (context,index){
                      return OrderCustom(snapshot.data!.docs[index]['date'],snapshot.data!.docs[index]['branch'], snapshot.data!.docs[index]['status'],
                          snapshot.data!.docs[index]['price'],snapshot.data!.docs[index]['number of items']);
                },
                  itemCount: snapshot.data!.docs.length,
                )
              );
            }
          }
        ),
      drawer: DrawerPage(),
    );
  }
}
