import 'package:flutter/material.dart';

class CalculatorProvider extends ChangeNotifier{
  String _input = '';
  String get input => _input;
dynamic _output ;
dynamic get output => _output;
bool _hideInput =false;
bool get hideInput => _hideInput;
double _outputSize = 34.0;
double get outputSize => _outputSize;

  onButtonClick(value){
 
//if value is AC
if(value=='AC'){
_input = '';
_output = null;  
}
else if(value=='←'){
  if(_input.isNotEmpty)
   _input = _input.substring(  0, _input.length - 1);
} else if(value == '='){
  if(input.isNotEmpty){
  var userInput;
  if(input.contains('×')){
 
   int index = input.indexOf('×');
  var firstValue = _input.substring(0,index).trim();
  print(firstValue);
  var secondValue = _input.substring(index + 1).trim();
 var multiply = double.parse(firstValue) * double.parse(secondValue);
 userInput = multiply.toString();
 notifyListeners();
  } else if(_input.contains('÷')){
  
     int index = _input.indexOf('÷');
  var firstValue = _input.substring(0,index).trim();
  print(firstValue);
  var secondValue = _input.substring(index + 1).trim();
  var divide = double.parse(firstValue) / double.parse(secondValue);
  userInput = divide.toString();
  notifyListeners();
  } else if(_input.contains('+')){
   int index = _input.indexOf('+');
  var firstValue = _input.substring(0,index).trim();
  print(firstValue);
  var secondValue = _input.substring(index + 1).trim();
  var add = double.parse(firstValue) + double.parse(secondValue);
  userInput = add.toString(); 
  notifyListeners();
  } else if(input.contains('-')){
   int index = _input.indexOf('-');
  var firstValue = _input.substring(0,index).trim();
  print(firstValue);
  var secondValue = _input.substring(index + 1).trim();
  var sub = double.parse(firstValue) - double.parse(secondValue);
  userInput = sub.toString(); 
  notifyListeners();
  }
  else if(input.contains('%')){
    int index = _input.indexOf('%');
  var firstValue = _input.substring(0,index).trim();
  print(firstValue);
  var secondValue = _input.substring(index + 1).trim();
  print(secondValue);
  var perecetange = (double.parse(firstValue) / 100) * double.parse(secondValue);
 userInput = perecetange.toString();
 notifyListeners();
  }
_output = userInput;
//   Parser p = Parser();
//   Expression expression = p.parse(userInput);
//   ContextModel cm = ContextModel();
//   double finlValue = expression.evaluate(EvaluationType.REAL, cm);
//  output = finlValue.toString();
//  print(output);
  }
  _input = output;
  _hideInput=true;
  _outputSize = 52;
  notifyListeners();
} else if(value == '+/-'){
  var value;
if(_input.contains('+')){
  
 value = _input.replaceAll('+', '-');
_input = value;
} else if(_input.contains('-')){
value =  _input.replaceAll('-', '+');
_input = value;
notifyListeners();
}
}

 else {
  _input = _input + value;
  _hideInput= false;
  _outputSize = 34;
notifyListeners();
}

notifyListeners();
}
}