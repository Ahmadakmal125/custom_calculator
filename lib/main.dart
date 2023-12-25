import 'package:calculator/screens/colors.dart';
import 'package:flutter/material.dart';
void main(){
  runApp( const MaterialApp(
    home:  Calculator() ,
  ));
}
class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
//variables

var input = '';
var output ;
var hideInput =false;
var outputSize = 34.0;

onButtonClick(value){
 
//if value is AC
if(value=='AC'){
input = '';
output = null;  
}
else if(value=='←'){
  if(input.isNotEmpty)
    input =  input.substring(  0, input.length - 1);
} else if(value == '='){
  if(input.isNotEmpty){
  var userInput;
  if(input.contains('×')){
 
   int index = input.indexOf('×');
  var firstValue = input.substring(0,index).trim();
  print(firstValue);
  var secondValue = input.substring(index + 1).trim();
 var multiply = double.parse(firstValue) * double.parse(secondValue);
 userInput = multiply.toString();
  } else if(input.contains('÷')){
  
     int index = input.indexOf('÷');
  var firstValue = input.substring(0,index).trim();
  print(firstValue);
  var secondValue = input.substring(index + 1).trim();
  var divide = double.parse(firstValue) / double.parse(secondValue);
  userInput = divide.toString();
  } else if(input.contains('+')){
   int index = input.indexOf('+');
  var firstValue = input.substring(0,index).trim();
  print(firstValue);
  var secondValue = input.substring(index + 1).trim();
  var add = double.parse(firstValue) + double.parse(secondValue);
  userInput = add.toString(); 
  } else if(input.contains('-')){
   int index = input.indexOf('-');
  var firstValue = input.substring(0,index).trim();
  print(firstValue);
  var secondValue = input.substring(index + 1).trim();
  var sub = double.parse(firstValue) - double.parse(secondValue);
  userInput = sub.toString(); 
  }
  else if(input.contains('%')){
    int index = input.indexOf('%');
  var firstValue = input.substring(0,index).trim();
  print(firstValue);
  var secondValue = input.substring(index + 1).trim();
  print(secondValue);
  var perecetange = (double.parse(firstValue) / 100) * double.parse(secondValue);
 userInput = perecetange.toString();
  }
output = userInput;
//   Parser p = Parser();
//   Expression expression = p.parse(userInput);
//   ContextModel cm = ContextModel();
//   double finlValue = expression.evaluate(EvaluationType.REAL, cm);
//  output = finlValue.toString();
//  print(output);
  }
  input = output;
  hideInput=true;
  outputSize = 52;
} else if(value == '+/-'){
  var value;
if(input.contains('+')){
  
 value = input.replaceAll('+', '-');
input = value;
} else if(input.contains('-')){
value =  input.replaceAll('-', '+');
input = value;

}
}

 else {
  input = input + value;
  hideInput= false;
  outputSize = 34;
}

setState(() {
  
});

}

  @override
  Widget build(BuildContext context) {
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
                hideInput ? '' : input,
               style: const TextStyle(
                fontSize: 48,
               color: Colors.white,
              ),
              ),
              const SizedBox(
                height: 20,
              ),
            
          if(output != null)    Text(double.parse(output).toStringAsFixed(5),
               style: TextStyle(
                fontSize: outputSize,
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
        button(text: 'AC',tColor: Colors.green),
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
        button(text: '%'),
         button(text: '0'),
         button(text: '.'),
          button(text: '=',buttonBgColor: Colors.green),  
        ],
       ),
       
        ],
      ),
    );
  }

Widget button({
  text, tColor = Colors.black,buttonBgColor = buttonColor
}) {
  return  Expanded(
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
              onPressed: () => onButtonClick(text),
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
  
}