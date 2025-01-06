import 'package:final_project/first.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:final_project/firebase.dart';

class Authentication extends StatefulWidget{
  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController t1 =new TextEditingController();
  TextEditingController t2 =new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center(child: Text('Login/Signup')),
        backgroundColor:Colors.green,

      ),
      body:Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Username"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
          TextField(controller:t1,
            decoration:InputDecoration(filled:true,fillColor:Colors.white,
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Password"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
          TextField(controller:t2,obscureText:true,
            decoration:InputDecoration(filled:true,fillColor:Colors.white,
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),),
        ),
        Padding(
          padding:  EdgeInsets.fromLTRB(110,30,0,0),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: ()async{
                bool shouldNavigate =await signIn(t1.text, t2.text);
                if (shouldNavigate){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>First()));
                }

              }, child: Text("Log In"),style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.blue),
                    )),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: () async {
                bool shouldNavigate =await register(t1.text, t2.text);
                if (shouldNavigate){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>First()));
                }
              }, child: Text("Sign Up"),style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.blue),
                    )),
              )),
            )
          ],),
        )


      ],),


    );
  }
}