import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/drawer.dart';
import 'package:final_project/orders_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'calculate_total_cost.dart';

class CheckoutPage extends StatefulWidget{
  dynamic itemsNumber;
  CheckoutPage(this.itemsNumber){}
  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String branch='Nasr City branch';
  dynamic totalPrice=CalculateTotalCost();
  dynamic orderPrice=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Out'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.grey[200],
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Select branch to receive your order:',style: TextStyle(fontSize: 18),),
              RadioListTile(value: 'Nasr City branch',
                groupValue: branch,
                onChanged: (value){
                setState(() {
                  branch=value!;
                });
                },
                title: Text('Nasr City branch'),),
              RadioListTile(
                value: 'Maadi branch',
                groupValue: branch,
                onChanged: (value){
                  setState(() {
                    branch=value!;
                  });
                },
                title: Text('Maadi branch'),),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Text('Total Cost',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    Expanded(child: SizedBox()),
                    Padding(padding: EdgeInsets.only(right: 25),
                    child: totalPrice,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Container(
                  color: Colors.grey[400],
                  width: double.infinity,
                  height: 1,
                ),
              ),
              Center(
                child: Padding(
                  padding:  EdgeInsets.only(top: 20),
                  child: FutureBuilder(
                    future: FirebaseFirestore.instance.collection('cart').get(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData==false){
                        return CircularProgressIndicator();
                      }
                      else {
                        for (int i = 0; i < snapshot.data!.docs.length; i++) {
                          orderPrice= orderPrice+ snapshot.data!.docs[i]['total price'];
                        }
                        return ElevatedButton(
                          onPressed: () {
                            FirebaseFirestore.instance.collection('orders').
                            add({'branch':branch,'date':DateTime.now(),
                              'number of items':widget.itemsNumber,'status':"pending",'price':orderPrice});
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>OrdersPage()));
                            Fluttertoast.showToast(msg: 'Order Placed Successfully',
                              toastLength: Toast.LENGTH_LONG,
                            );
                          },
                          child: Text('Place Order'),
                        );
                      }
                    }
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      drawer: DrawerPage(),
    );
  }
}