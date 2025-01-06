import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_project/product.dart';

import 'DetailsCustom.dart';

class Bmw extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title:
          Text("BMW Products",style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.bold),),
        ),
        body:FutureBuilder(
            future: FirebaseFirestore.instance.collection('brands').doc('sCyCK3WPVlzvnIaMNBVs').collection('bmw').get(),
            builder: (context, snapshot) {
              if(snapshot.hasData==false){
                return Center(child: CircularProgressIndicator());
              }
              else {
                return Container(
                  color: Colors.grey[200],
                  child:
                  ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20, top: 40,),
                        child: Product(snapshot.data?.docs[index]["image"],
                            snapshot.data?.docs[index]["name"], DetailsCustom(
                                snapshot.data?.docs[index]["image"],
                                snapshot.data?.docs[index]["image"],
                                snapshot.data?.docs[index]["name"], snapshot.data?.docs[index]["price"], snapshot.data?.docs[index]["year"],
                                snapshot.data?.docs[index]["color"],snapshot.data!.docs[index].id,
                                snapshot.data!.docs[index].reference.parent.id.toString())
                        ),
                      );
                    },
                  ),
                );
              }
            }
        ),
        drawer: DrawerPage(),
    );
  }
}
