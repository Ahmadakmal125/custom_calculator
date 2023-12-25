
import 'package:calculator/screens/calculator_screen.dart';
import 'package:calculator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/calculator_provider.dart';

Widget button({ BuildContext? contextt,text, tColor = Colors.black,buttonBgColor = buttonColor
}) {
  return  Consumer<CalculatorProvider>(
    builder: (context, provider, _) {
      return Expanded(
              child:
               Container(
                margin: const EdgeInsets.all(8),
                 child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    ) ,
                    padding: EdgeInsets.all(22),
                     primary: buttonBgColor
                  ) ,
                  onPressed: (){ provider.onButtonClick(text);},
                  child: 
                   Text(text,
                  style: TextStyle(
                    fontSize: 20,
                    color: tColor,
                    fontWeight: FontWeight.bold,
                  ),)
                  ),
               ));
    }
  );
}