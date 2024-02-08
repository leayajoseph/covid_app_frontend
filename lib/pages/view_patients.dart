import 'package:covid_app/models/patient_models.dart';
import 'package:covid_app/services/patient_services.dart';
import 'package:flutter/material.dart';

class ViewPatients extends StatefulWidget {
  const ViewPatients({super.key});

  @override
  State<ViewPatients> createState() => _ViewPatientsState();
}

class _ViewPatientsState extends State<ViewPatients> {
  Future<List<Patient>> ? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=PatientApiService().getPatient();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Covid App"),
        ),
        body: FutureBuilder(
            future: data,
            builder: (context,snapshot)
        {
          if(snapshot.hasData && snapshot.data!.isNotEmpty)
            {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context,index)
              {
                return Card(
                  child: Column(
                    children: [
                      Text("name: "+snapshot.data![index].name),
                      Text("Ph no: "+snapshot.data![index].phone),
                      Text("address: "+snapshot.data![index].address),
                      Text("symptoms: "+snapshot.data![index].symptoms),
                      Text("status: "+snapshot.data![index].status),
                    ],
                  ),
                );
              });
            }
          else
            {
              return Text("Loading");
            }
        }),

      ),

    );
  }
}
