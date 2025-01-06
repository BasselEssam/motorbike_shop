import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class AboutUs extends StatelessWidget{
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.black,
        title: Text("About Us"),
      ),
      body:ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text("Our Dealership",style:TextStyle(fontSize:20,fontWeight:FontWeight.bold),)),
        )
        ,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(width:400,height: 200,decoration: BoxDecoration(
    border: Border.all(color: Colors.deepPurple,
    ),
    borderRadius: BorderRadius.all(Radius.circular(20))
    ),

    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('A quality Motorcycle dealership can make all the difference in the world. If you have a specific Motorcycle\n'
              'you will find it here using our app. Our dealership has two branches one in Madinet Nasr and one in Al Maadi'
      ,style:TextStyle(fontSize:21)),
    ),
    ),
          ),
        )
      ,
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Our Branches",style: TextStyle(fontSize:20),),

      ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text("Madinet Nasr Branch")),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(decoration: BoxDecoration(
              border: Border.all(color: Colors.deepPurple,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurple,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                    ElevatedButton(onPressed: (){
                      FlutterPhoneDirectCaller.callNumber("01033464234");
                    },child:Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Call Us",style:TextStyle(fontWeight:FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.call,color:Colors.green,),
                      )

                    ],),),
                  ),
                ),
              )
              ,
              Center(child: Container(width:200,height: 185,color:Colors.grey,child:GoogleMap(
                  onMapCreated:(x){},initialCameraPosition:CameraPosition(
                  target:LatLng(30.049596481508644, 31.313473604492657),
                  zoom:10.0)
                  , markers:{

                Marker(
                    markerId:MarkerId(""),
                    position: LatLng(30.049596481508644, 31.313473604492657)
                    ,infoWindow:InfoWindow(
                    title: 'location',
                    snippet: ''),
                    icon:BitmapDescriptor.defaultMarker
                )
              }))
              )


            ],),
          ),
        ),


        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text("Al Maadi Branch")),
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(decoration: BoxDecoration(
              border: Border.all(color: Colors.deepPurple,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(decoration: BoxDecoration(
    border: Border.all(color: Colors.deepPurple,
    ),
    borderRadius: BorderRadius.all(Radius.circular(20))
    ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(onPressed: (){
                      FlutterPhoneDirectCaller.callNumber("01033464234");
                    },child:Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Call Us",style:TextStyle(fontWeight:FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.call,color:Colors.green,),
                      )

                    ],),),
                  ),
                ),
              ),
              Center(child: Container(width:200,height: 185,color:Colors.grey,child:GoogleMap(
                  onMapCreated:(x){},initialCameraPosition:CameraPosition(
                  target:LatLng(29.960239070265068, 31.303402558598176),
                  zoom:10.0)
                  , markers:{
                Marker(
                    markerId:MarkerId(""),
                    position: LatLng(29.960239070265068, 31.303402558598176)
                    ,infoWindow:InfoWindow(
                    title: 'location',
                    snippet: ''),
                    icon:BitmapDescriptor.defaultMarker
                )
              }))
              )


            ],),
          ),
        )
      ],)

    );

  }


}