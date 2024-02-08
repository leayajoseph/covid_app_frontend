import 'package:covid_app/services/patient_services.dart';
import 'package:flutter/material.dart';

class SearchPatient extends StatefulWidget {
  const SearchPatient({super.key});

  @override
  State<SearchPatient> createState() => _SearchPatientState();
}

class _SearchPatientState extends State<SearchPatient> {
  TextEditingController ob1=new TextEditingController();
  void searchValues() async{
    final response=await PatientApiService().sendSearchData(ob1.text);
    if(response["status"]=="success")
      {
        setState(() {
          Text("found");
        });
      }
    else
      {
        print("error");
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

              ElevatedButton(
                  onPressed: searchValues, child: Text("search")),
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
