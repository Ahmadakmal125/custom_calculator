import 'package:calculator/provider/calculator_provider.dart';
import 'package:calculator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'component/custom_button.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

//variables
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CalculatorProvider>(context, listen: true);
    return  Scaffold(
    
      backgroundColor: Colors.black,
      body: Column(
        children: [
          //input output area
       Expanded(
        child: Container(
          width: double.infinity,
      padding: const EdgeInsets.all(12),
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment:CrossAxisAlignment.end,
            children: [
              Text(
                provider.hideInput ? '' : provider.input,
               style: const TextStyle(
                fontSize: 48,
               color: Colors.white,
              ),
              ),
              const SizedBox(
                height: 20,
              ),
            
          if(provider.output != null)    Text(double.parse(provider.output).toStringAsFixed(5),
               style: TextStyle(
                fontSize:provider.outputSize,
               color: Colors.white.withOpacity(0.7),
              ),
              ),
              const SizedBox(
                height:1,
              )
            ],
          ),
          )),
       //buttons area
       Row(
        children: [ 
        button(
          text: 'AC',tColor: Colors.green),
         button(text: '←',tColor: Colors.green),
         button(text: '+/-',tColor: Colors.green),
          button(text: '÷',tColor: Colors.green),  
        ],
       ),
       Row(
        children: [ 
        button(text: '7'),
         button(text: '8'),
         button(text: '9'),
          button(text: '×',tColor: Colors.green),  
        ],
       ),
       Row(
        children: [ 
        button(text: '4'),
         button(text: '5'),
         button(text: '6'),
          button(text: '-',tColor: Colors.green),  
        ],
       ),
       Row(
        children: [ 
        button(text: '1'),
         button(text: '2'),
         button(text: '3'),
          button(text: '+',tColor: Colors.green),  
        ],
       ),
       Row(
        children: [ 
        button(
          text: '%'),
         button(text: '0'),
         button(text: '.'),
          button(text: '=',buttonBgColor: Colors.green),  
        ],
       ),
       
        ],
      ),
    );
  }
}