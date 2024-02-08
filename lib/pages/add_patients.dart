import 'dart:convert';

import 'package:covid_app/services/patient_services.dart';
import 'package:flutter/material.dart';

class AddPatients extends StatefulWidget {
  const AddPatients({super.key});

  @override
  State<AddPatients> createState() => _AddPatientsState();
}

class _AddPatientsState extends State<AddPatients> {
  TextEditingController ob1=new TextEditingController();
  TextEditingController ob2=new TextEditingController();
  TextEditingController ob3=new TextEditingController();
  TextEditingController ob4=new TextEditingController();
  TextEditingController ob5=new TextEditingController();

  void sendValues() async
  {
    final response=await PatientApiService().sendData(ob1.text, ob2.text, ob3.text, ob4.text, ob5.text);
    if(response["status"]=="success")
      {
        print("successfully added");
      }
    else
      {
        print("Error");
      }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Covid App"),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.orange.withOpacity(0.4),
                    Colors.yellow.withOpacity(0.4)
                  ]
              )
          ),
          padding: EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: ob1,
                decoration: InputDecoration(
                  labelText: "Enter name:",
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: ob2,
                decoration: InputDecoration(
                    labelText: "Enter phone number:",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: ob3,
                decoration: InputDecoration(
                    labelText: "Enter address:",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: ob4,
                decoration: InputDecoration(
                    labelText: "Enter symptoms:",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: ob5,
                decoration: InputDecoration(
                    labelText: "Enter status:",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: sendValues, child: Text("add")),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: ()
                  {
                    Navigator.pop(context);
                  }, child: Text("back")),
              SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );
  }
}
