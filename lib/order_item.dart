import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderCustom extends StatelessWidget {
dynamic branch ;
dynamic date ;
dynamic Status ;
dynamic Price ;
dynamic itemsNo ;

OrderCustom(this.date,this.branch,this.Status,this.Price,this.itemsNo);
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
                  Text(" Number of Items",textScaleFactor: 1.25,style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,fontSize: 12),),
                ]
            ),
            TableRow(
                children: [
                  Text( branch,textScaleFactor: 1.25,style: GoogleFonts.aBeeZee(fontSize: 12),),
                  Text(('${(date as Timestamp).toDate().day}/${(date as Timestamp).toDate().month}/${(date as Timestamp).toDate().year}').toString(),textScaleFactor: 1.25,style: GoogleFonts.aBeeZee(fontSize: 12),),
                  Text( Status,textScaleFactor: 1.25,style: GoogleFonts.aBeeZee(fontSize: 12),),
                  Text( itemsNo.toString(),textScaleFactor: 1.25,style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,fontSize: 12),),
                ]
            ),
          ],
        ),
      ),
      Divider(
        thickness: 1,
        color: Colors.black,
      ),
      Text("You should pay " ,style: GoogleFonts.aBeeZee(fontSize: 15),),
      Text(Price.toString() ,style:GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,fontSize: 15) ,),
      Divider(
        thickness: 3,
        color: Colors.teal,
      ),
    ]
);
  }
  }

