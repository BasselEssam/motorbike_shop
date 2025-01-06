import 'package:final_project/brand.dart';
import 'package:final_project/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_project/bmw.dart';
import 'package:final_project/ducati.dart';
import 'package:final_project/kawazaki.dart';
import 'package:final_project/ktm.dart';
import 'package:final_project/suzuki.dart';
import 'package:final_project/trimph.dart';

class First extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "Home",
          style: GoogleFonts.aBeeZee(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: Colors.grey[200],
        child: ListView(children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Brand("https://cdn.shopify.com/s/files/1/0235/2123/products/Kawasaki_Logo.jpg?v=1571264736", Kawasaki()),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Brand("https://i.pinimg.com/originals/18/01/e3/1801e3be1854ca4107e143fe0f996ea8.jpg", Bmw()),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 10, 5, 10)),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Brand("https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Suzuki_logo_2.svg/2560px-Suzuki_logo_2.svg.png", Suzuki()),
                  Padding(padding: EdgeInsets.only(left: 10)),
                 Brand("https://cdn-0.motorcycle-logos.com/wp-content/uploads/2016/10/Ducati-Logo-Description.png", Ducati()),
                ],
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 10, 5, 10)),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Brand("https://motorcycle-logos.com/wp-content/uploads/2016/10/Triumph-Motorcycles-Logo.png", Triumph()),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Brand("https://motosymbol.com/wp-content/uploads/2021/02/KTM-Emblem.png", Ktm()),
                ],
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 10, 5, 10)),
            ],
          ),
        ]),
      ),
      drawer: DrawerPage(),
    );
  }
}
