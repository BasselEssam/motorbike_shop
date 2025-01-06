import 'package:flutter/material.dart';

class Brand extends StatelessWidget{
  String image;
  dynamic page;

  Brand(this.image,this.page){}
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (Context) => page));
      },
      style: ElevatedButton.styleFrom(
          primary: Colors.white, //background color of button
          side: BorderSide(
              width: 3,
              color: Colors.black), //border width and color
          elevation: 0, //elevation of button
          shape: RoundedRectangleBorder(
            //to set border radius to button
              borderRadius: BorderRadius.circular(50)),
          padding:
          EdgeInsets.all(20) //content padding inside button
      ),
      child: Image.network(
        image,
        width: 150,
        height: 150,
      ),
    );
  }
}