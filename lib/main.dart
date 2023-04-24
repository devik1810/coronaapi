import 'package:coronaapi/screen/provider/coronaProvider.dart';
import 'package:coronaapi/screen/view/coronaview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CoronaProvider(),)
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => CoronaScreen(),
      },
    ),
  ));
}