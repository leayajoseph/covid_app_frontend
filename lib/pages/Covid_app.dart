import 'package:flutter/material.dart';

class CovidApp extends StatelessWidget {
  const CovidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ElevatedButton(
                onPressed: ()
                {

                }, child: Text("add patients")),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: ()
                {

                }, child: Text("search patients")),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: ()
                {

                }, child: Text("view patients")),
            SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}
