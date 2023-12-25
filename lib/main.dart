import 'package:calculator/provider/calculator_provider.dart';
import 'package:calculator/utils/colors.dart';
import 'package:flutter/material.dart';

import 'screens/calculator_screen.dart';
import 'package:provider/provider.dart';
void main(){
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
    providers: [ChangeNotifierProvider(create: (_)=> CalculatorProvider())],
    child: const MaterialApp(
      home:  Calculator() ,
    ),
  );
  }
}