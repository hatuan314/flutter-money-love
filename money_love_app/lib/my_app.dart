import 'package:flutter/material.dart';
import 'package:moneyloveapp/route.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Nunito',
        backgroundColor: Color(0xffFCFAF3),
      ),
      onGenerateRoute: router(),
    );
  }
}
