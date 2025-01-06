import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget{
  //String image;
  //String name;
  //int price;
  int quantity;
  dynamic totalPrice=0;
  dynamic productParent;
  dynamic productId;
  dynamic cartId;

  CartItem(this.quantity,this.productParent,this.productId,this.cartId){}
  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {

  @override
  Widget build(BuildContext context) {
   return FutureBuilder(
     future: FirebaseFirestore.instance.collection('brands').doc('sCyCK3WPVlzvnIaMNBVs').collection(widget.productParent).doc(widget.productId).get(),
     builder: (context, snapshot) {
       if(snapshot.hasData==false){
         return CircularProgressIndicator();
       }
       else {
         return Padding(
           padding: const EdgeInsets.only(bottom: 8.0),
           child: Container(
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(20),
             ),
             height: MediaQuery.of(context).size.height / 7,
             child: Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 5, right: 5,),
                   child: Image.network(snapshot.data!["image"], width: 115,),
                 ),
                 Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(snapshot.data!["name"]),
                     Padding(
                       padding: const EdgeInsets.only(top: 8.0),
                       child: Text(snapshot.data!["price"].toString()),
                     ),
                   ],
                 ),
                 Expanded(child: SizedBox()),
                 Text(widget.quantity.toString(),
                   style: TextStyle(fontWeight: FontWeight.bold),),
                 Padding(
                   padding: EdgeInsets.only(left: 1),
                   child: Column(
                     children: [
                       IconButton(onPressed: () {
                         setState(() {
                           widget.quantity > 0 ?
                           widget.quantity = widget.quantity - 1 : widget.quantity;
                           FirebaseFirestore.instance.collection('cart').doc(widget.cartId).update({'quantity':widget.quantity});
                           widget.totalPrice = widget.quantity * snapshot.data!["price"];
                           FirebaseFirestore.instance.collection('cart').doc(widget.cartId).update({'total price':widget.totalPrice});
                         });
                       },
                           icon: Icon(Icons.remove,)),
                       IconButton(onPressed: () {
                         setState(() {
                           widget.quantity = widget.quantity + 1;
                           FirebaseFirestore.instance.collection('cart').doc(widget.cartId).update({'quantity':widget.quantity});
                           widget.totalPrice = widget.quantity * snapshot.data!["price"];
                           FirebaseFirestore.instance.collection('cart').doc(widget.cartId).update({'total price':widget.totalPrice});
                         });
                       }, icon: Icon(Icons.add),
                         color: Colors.blue[200],),
                     ],
                   ),
                 ),
               ],
             ),
           ),
         );
       }
     }
   );
  }
}