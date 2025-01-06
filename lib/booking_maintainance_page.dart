import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/drawer.dart';
import 'package:final_project/maintenance_history_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BookingMaintainance extends StatefulWidget{
  @override
  State<BookingMaintainance> createState() => _BookingMaintainanceState();
}

class _BookingMaintainanceState extends State<BookingMaintainance> {
  String time = '10';
  var items=['10','11','12','1','2','3','4','5','6','7','8','9',];
  DateTime bookingDate=DateTime.now();
  String branch='Nasr City';
  TextEditingController t1=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Maintainance Booking'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30,right: 20,left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ElevatedButton(onPressed: ()async{
                    DateTime newDate=(await showDatePicker(
                      context: context, initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                      lastDate: DateTime(2023),
                    ))!;
                    if(newDate==null)return;
                    setState(() {
                      bookingDate=newDate;
                    });
                  }
                      , child: Text('Select Date'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("${bookingDate.day}/${bookingDate.month}/${bookingDate.year}"),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15,right: 15),
                    child: Text('Select time'),
                  ),
                  DropdownButton(
                    value: time,
                    items: items.map((e) {return DropdownMenuItem(
                      child: Text(e),
                      value: e,
                    );
                    }).toList(),
                    onChanged: ( value){
                      setState(() {
                        time=value.toString();
                      });
                    },
                  ),
                ],
              ),
              RadioListTile(value: 'Nasr City',
                groupValue: branch,
                onChanged: (value){
                  setState(() {
                    branch=value!;
                  });
                },
                title: Text('Nasr City branch'),),
              RadioListTile(
                value: 'Maadi',
                groupValue: branch,
                onChanged: (value){
                  setState(() {
                    branch=value!;
                  });
                },
                title: Text('Maadi branch'),),
              TextFormField(
                controller: t1,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2),
                  ),
                  hintText: "What service do you want?",
                )
              ),
              Center(
                child: ElevatedButton(onPressed: (){
                  FirebaseFirestore.instance.collection('maintenance').add(
                      {'date':bookingDate,'branch':branch,'time':time,'service':t1.text,'status':'pending'});
                  Fluttertoast.showToast(msg: 'Maintenance request submitted');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MaintenanceHistory()));
                },
                  child: Text('submit'),
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