import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccSettings extends StatefulWidget {
  @override
  State<AccSettings> createState() => _AccSettingsState();
}

class _AccSettingsState extends State<AccSettings> {
  TextEditingController t1 = new TextEditingController();
  TextEditingController t2 = new TextEditingController();

  dynamic x = Image.network(
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFw5-Xzbno5hzXlze0BCT6QqKqzy7QV1CrS-vMvSUCI3bsYglxWZtjwWJZ1v8MWVgLnTM&usqp=CAU");

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(child: Text("Account Settings")),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Center(
                child: CircleAvatar(radius: 50, child: ClipOval(child: x)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Change \nProfile\nPicture"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blueGrey),
                        ))),
                        onPressed: () async {
                          ImagePicker a = new ImagePicker();
                          dynamic b =
                              await a.getImage(source: ImageSource.camera);
                          setState(() {
                            if (b != null) {
                              x = Image.file(File(b.path));
                            }
                          });
                        },
                        child: Text("From Camera")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blueGrey),
                        ))),
                        onPressed: () async {
                          ImagePicker a = new ImagePicker();
                          dynamic b =
                              await a.getImage(source: ImageSource.gallery);
                          setState(() {
                            if (b != null) {
                              x = Image.file(File(b.path));
                            }
                          });
                        },
                        child: Text("From Gallery")),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 70,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
                      child: Icon(Icons.drive_file_rename_outline),
                    ),
                    Text(
                      "Name",
                      style: TextStyle(fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 40,
                          width: 200,
                          child: TextField(
                            controller: t1,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,
                                fillColor: Colors.white),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 70,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
                      child: Icon(Icons.call),
                    ),
                    Text(
                      "Phone",
                      style: TextStyle(fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 40,
                          width: 200,
                          child: TextField(
                            controller: t2,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,
                                fillColor: Colors.white),
                          )),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: ElevatedButton(
                    onPressed: () {
                      String x= t1.text;
                      String y= t2.text;
                      FirebaseFirestore.instance.collection("user info").doc('user info').update(
                          <String,dynamic>{
                            'name':x,
                            'phone':y,
                          }
                      );
                      Fluttertoast.showToast(msg: 'Updated Successfully');
                    },
                    child: Text("Save"),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blueGrey),
                      )),
                    )),
              ),
            )
          ],
        ),
      drawer: DrawerPage(),
    );
  }
}
