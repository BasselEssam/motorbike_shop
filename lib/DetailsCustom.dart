import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailsCustom extends StatelessWidget{
dynamic image1;
dynamic image2;
dynamic make;
dynamic price;
dynamic year;
dynamic color;
dynamic productId;
dynamic productParent;
DetailsCustom(this.image1,this.image2,this.make,this.price,this.year,this.color,this.productId,this.productParent);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar:AppBar(backgroundColor: Colors.black,title:Center(child: Text("Product Details")),),
      body:ListView(children: [
      CarouselSlider(
      options: CarouselOptions(
      height: 200,
        aspectRatio: 16/9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      items: [
      //1st Image of Slider
      Container(
      margin: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: NetworkImage(image1),
        ),
      ),
    ),
    //2nd Image of Slider
    Container(
    margin: EdgeInsets.all(6.0),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8.0),
    image: DecorationImage(
    image: NetworkImage(image2),
    ),
    ),
    ),
      ],),
        Row(children: [
          Padding(
          padding:  EdgeInsets.fromLTRB(82,0,100,30),
          child: Icon(Icons.arrow_back_ios_new_outlined,color:Colors.blue,),
        ),Padding(
          padding: EdgeInsets.fromLTRB(100,0,20,30),
          child: Icon(Icons.arrow_forward_ios,color:Colors.blue),
        )]),
        Padding(
        padding:  EdgeInsets.fromLTRB(10,10,10,5),
        child: Row(children:[ Text("Product Details",style:TextStyle(fontSize:18,color: Colors.grey)),
          Padding(
            padding:  EdgeInsets.fromLTRB(180,0,0,0),
            child: FloatingActionButton(
              backgroundColor:Colors.teal,
              onPressed: (){
                FirebaseFirestore.instance.collection('favorites').add({'id':productId,'parent':productParent,'quantity':1,'total price':price});
                Fluttertoast.showToast(msg: 'Added to favorites',
                toastLength: Toast.LENGTH_LONG);
              },
              disabledElevation: 0,
              child:Icon(Icons.favorite,color:Colors.red,),
            ),
          )]),
      ),
        Padding(
          padding: const EdgeInsets.all(19),
          child: Container(height:70,child:Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.factory_outlined),
            )
            ,Text("Make",style:TextStyle(fontSize:20,color:Colors.black))
            ,Padding(
              padding:  EdgeInsets.fromLTRB(20,0,0,0),
              child: Text(make,style:TextStyle(fontSize:15,color:Colors.black)),
            )
          ],),decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(height:70,child:Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.attach_money),
            )
            ,Text("Price",style:TextStyle(fontSize:20,color:Colors.black))
            ,Padding(
              padding:  EdgeInsets.fromLTRB(200,0,0,0),
              child: Text(price.toString(),style:TextStyle(fontSize:20,color:Colors.black)),
            )
          ],),decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(height:70,child:Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.date_range),
            )
            ,Text("Year",style:TextStyle(fontSize:20,color:Colors.black))
            ,Padding(
              padding:  EdgeInsets.fromLTRB(200,0,0,0),
              child: Text(year.toString(),style:TextStyle(fontSize:20,color:Colors.black)),
            )
          ],),decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(height:70,child:Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.color_lens_outlined),
            )
            ,Text("Color",style:TextStyle(fontSize:20,color:Colors.black))
            ,Padding(
              padding:  EdgeInsets.fromLTRB(200,0,0,0),
              child: Text(color,style:TextStyle(fontSize:20,color:Colors.black)),
            )
          ],),decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))
          )),
        ),
        Center(
          child: ElevatedButton(onPressed: (){
            FirebaseFirestore.instance.collection('cart').add({'id':productId,'parent':productParent,'quantity':1,'total price':price});
            Fluttertoast.showToast(msg: 'Added to shopping cart',
                toastLength: Toast.LENGTH_LONG);
          },
              child: Text('Add to cart'),),
        )
        ],
    ),
      drawer: DrawerPage(),
    );
  }
}