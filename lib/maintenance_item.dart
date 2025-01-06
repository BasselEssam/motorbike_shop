import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MaintenanceItem extends StatelessWidget {
  dynamic branch ;
  dynamic date ;
  dynamic Status ;
  dynamic service ;
  dynamic time ;

  MaintenanceItem(this.date,this.branch,this.Status,this.service,this.time);
  Widget build(BuildContext context) {
    return Column(
        children:<Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              textDirection: TextDirection.ltr,
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              border:TableBorder.all(width: 1.5,color: Colors.black),
              children: [
                TableRow(
                    children: [
                      Text(" Branch",textScaleFactor: 1.25,style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,fontSize: 12),),
                      Text(" Date",textScaleFactor: 1.25,style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,fontSize: 12),),
                      Text(" Status",textScaleFactor: 1.25,style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,fontSize: 12),),
                      Text(" Service",textScaleFactor: 1.25,style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,fontSize: 12),),
                    ]
                ),
                TableRow(
                    children: [
                      Text( branch,textScaleFactor: 1.25,style: GoogleFonts.aBeeZee(fontSize: 12),),
                      Text(('${(date as Timestamp).toDate().day}/${(date as Timestamp).toDate().month}/${(date as Timestamp).toDate().year}/$time').toString(),textScaleFactor: 1.25,style: GoogleFonts.aBeeZee(fontSize: 12),),
                      Text( Status,textScaleFactor: 1.25,style: GoogleFonts.aBeeZee(fontSize: 12),),
                      Text( service,textScaleFactor: 1.25,style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,fontSize: 12),),
                    ]
                ),
              ],
            ),
          ),
          Divider(
            thickness: 3,
            color: Colors.teal,
          ),
        ]
    );
  }
}

