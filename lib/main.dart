import 'package:covid_app/pages/Covid_app.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(covid());
}
class covid extends StatelessWidget {
  const covid({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CovidApp(),
    );
  }
}
