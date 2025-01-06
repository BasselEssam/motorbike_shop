import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/cart_item.dart';
import 'package:final_project/checkout_page.dart';
import 'package:final_project/drawer.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget{
  dynamic totalPrice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('cart').get(),
        builder: (context, snapshot) {
          if(snapshot.hasData==false){
            return CircularProgressIndicator();
          }
          else {
            return Container(
              color: Colors.grey[200],
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(22),
                    child: Container(
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: MediaQuery.of(context).size.height / 1.5,
                        child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              return CartItem(snapshot.data!.docs[index]['quantity'],
                              snapshot.data!.docs[index]['parent'],snapshot.data!.docs[index]['id'],
                                  snapshot.data!.docs[index].id
                              );
                            }
                        )
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Container(
                    color: Colors.white,
                    height: 100,
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width/2.1,
                        child: ElevatedButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckoutPage(snapshot.data!.docs.length)));
                        },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.check_circle_outline),
                              Text('Check Out',),
                            ],
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.purple[900]),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        }
      ),
      drawer: DrawerPage(),
    );
  }
}