import 'package:flutter/material.dart';

class CheckoutItem extends StatelessWidget{
  String image;
  String name;
  int price;
  int quantity;

  CheckoutItem(this.image,this.name,this.price,this.quantity){}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        height: MediaQuery.of(context).size.height/7,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8,right: 20,),
              child: Image.network(image,width: 115,),
            ),
            Text(name),
            Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/7),
              child: Text(price.toString()),
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: EdgeInsets.only(right: 25),
              child: Text(quantity.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}