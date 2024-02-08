import 'dart:convert';

import 'package:covid_app/models/patient_models.dart';
import 'package:http/http.dart' as http;
class PatientApiService
{
  Future<dynamic> sendData(
      String name,String ph, String address, String symptoms,String status
      ) async{
    var client=http.Client();
    var apiUrl=Uri.parse("http://localhost:3001/api/patient/patient_entry");
    var response=await client.post(apiUrl,
    headers: <String,String>{
      "Content-Type":"application/json ; charset=UTF-8"
    },
    body:  jsonEncode(<String,String>{
      "name": name,
      "phone": ph,
      "address": address,
      "symptoms": symptoms,
      "status": status
    }));
    if(response.statusCode==200)
      {
        return jsonDecode(response.body);
      }
    else
      {
        throw Exception("Failed");
      }
  }
  Future<List<Patient>> getPatient() async{
    var client=http.Client();
    var apiUrl=Uri.parse("http://localhost:3001/api/patient/patient_view");
    var response=await client.get(apiUrl);
    if(response.statusCode==200)
      {
        return patientFromJson(response.body);
      }
    else
      {
        return [];
      }
  }
}