import 'package:final_project/DetailsCustom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Product extends StatelessWidget {
  dynamic image;
  dynamic text;
  dynamic page;

  Product(this.image, this.text,this.page);
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
            padding: EdgeInsets.only(
          left: 50,
        )),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>page)
              );
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                //background color of button
                side: BorderSide(
                    width: 3,
                    color: Colors.white), //border width and color
                elevation: 0, //elevation of button
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                padding: EdgeInsets.all(20) //content padding inside button
                ),
            child: Column(
              children: [
                Container(
                  width: 250,
                  height: 250,
                  child: Column(
                    children: [
                      Image.network(
                        image,
                        width: 200,
                        height: 200,
                      ),
                      Text(
                        text,
                        style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(color: Colors.black),
                            fontSize: 20),
                      ),
                    ],
                  ),
                )
              ],
            )),
        Padding(padding: EdgeInsets.only(left: 20)),
      ],
    );
  }
}
