import 'package:calculator_app/constants.dart';
import 'package:mobx/mobx.dart';
part "calculator_state.g.dart";

class CalculatorState extends _CalculatorState with _$CalculatorState {
  CalculatorState();
}

abstract class _CalculatorState with Store{

  @observable
  String userInput = "";

  @observable
  String answer = "";

  @observable
  bool themeIsDark = true;

  @action
  void changeTheme(){
    this.themeIsDark = !this.themeIsDark;
  }

  @action
  void clean(){
    this.userInput = "";
    this.answer = "";
  }

  @action
  void delete(){
    this.userInput = this.userInput.substring(0, this.userInput.length - 1);
  }

  @action
  void result(){
    if(isLastOneIsOperator() || this.userInput.isEmpty){ return; }

    this.answer = calculateResult().toString();
  }

  @action
  void resultPlusMinus(){
    if(isLastOneIsOperator() || this.userInput.isEmpty){return;}

    final result = calculateResult();
    this.answer = result.toString();

    var d = 0.0;
    d = result;
    d *= -1;
    this.answer = d.toString();

  }

  @action
  void resultPercentage(){
    if(isLastOneIsOperator() || this.userInput.isEmpty){return;}

    final result = calculateResult();
    this.answer = result.toString();

    var d = 0.0;
    d = result;
    d = d / 100;
    this.answer = d.toString();

  }

  @action
  void addUserInput(String inputChar){

    if(_isFirstOneIsOperator(inputChar)){return;}

    if(_isLastOneIsOperator(inputChar)){
      this.userInput = this.userInput.replaceRange(this.userInput.length - 1 , this.userInput.length, inputChar);
   }else{
      this.userInput += inputChar;
   }



  }

   _isLastOneIsOperator(String inputChar) {
     var list = ["/", "%" , "*", "+", "-"];
     if(userInput.isNotEmpty){
      print("input=>"+userInput +" last input=>"+ userInput.substring(userInput.length - 1)+" inputChar=>"+inputChar);
     }

     if ( userInput.isNotEmpty && list.contains(userInput.substring( userInput.length - 1)) && list.contains(inputChar) && userInput.substring( userInput.length - 1) != "."){
       return true;
     }else{
       return false;
     }
   }

    isLastOneIsOperator() {
    var list = ["/", "%" , "*", "+", "-", "."];
    if ( userInput.isNotEmpty && list.contains(userInput.substring( userInput.length - 1))){
      return true;
    }else{
      return false;
    }
  }

  _isFirstOneIsOperator(String inputChar) {
    var list = ["/", "%" , "*", "+", "-", "+/-", "."];
    if (this.userInput.isEmpty && list.contains(inputChar)){
      return true;
    }else{
      return false;
    }
  }


  configElements(){
    var resultElements = [];
    var startIndex = 0;
    var endIndex = 0;
    var tempindex = 0;
    var inputstr = this.userInput;
    for (var s in inputstr.split("")) {
      if (operators.contains(s)) {
        endIndex = tempindex;
        resultElements.add("${inputstr.substring(startIndex, endIndex)}");
        resultElements.add("$s");
        inputstr = inputstr.substring(endIndex + 1);
        tempindex = -1;
      }

      tempindex++;
    }

    if (inputstr.isNotEmpty && !operators.contains(inputstr)) {
      resultElements.add("$inputstr");
    }

    return resultElements;

  }

  double calculateResult() {
    var calElements = [];
    calElements = configElements();
    var curval = "";
    double a = 0.0;
    double b = 0.0;

    while(calElements.length != 1){
      for(int i = 0; i< calElements.length; i++) {
        if (calElements[i] == "*" || calElements[i] == "/") {
          a = double.parse(calElements[i - 1]);
          b = double.parse(calElements[i + 1]);
          curval = calElements[i] == "*" ? "${(a * b)}" : "${(a / b)}";
          calElements[i] = curval;
          calElements.removeAt(i-1);
          calElements.removeAt(i);
          break;
        }
      }

      if(!calElements.contains("*") && !calElements.contains("/")){
        for(int i = 0; i< calElements.length; i++) {
          if (calElements[i] == "+" || calElements[i] == "-") {
            a = double.parse(calElements[i - 1]);
            b = double.parse(calElements[i + 1]);
            curval = calElements[i] == "+" ? "${(a + b)}" : "${(a - b)}";
            calElements[i] = curval;
            calElements.removeAt(i-1);
            calElements.removeAt(i);
            break;
          }
        }


      }

    }

    return double.parse(calElements.first);
  }


}