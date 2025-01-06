import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/booking_maintainance_page.dart';
import 'package:final_project/drawer.dart';
import 'package:final_project/maintenance_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_project/order_item.dart';

class MaintenanceHistory extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title:
        Container(child:
        Text("Maintenance requests",style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.bold),),
        ),
      ),
      body:FutureBuilder(
          future: FirebaseFirestore.instance.collection('maintenance').get(),
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
                      return MaintenanceItem(snapshot.data!.docs[index]['date'], snapshot.data!.docs[index]['branch']
                          , snapshot.data!.docs[index]['status'], snapshot.data!.docs[index]['service'],snapshot.data!.docs[index]['time']);
                    },
                    itemCount: snapshot.data!.docs.length,
                  )
              );
            }
          }
      ),
      drawer: DrawerPage(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingMaintainance()));
      },
        child: Icon(Icons.add),
      ),
    );
  }
}
