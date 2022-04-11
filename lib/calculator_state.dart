import 'package:math_expressions/math_expressions.dart';
import 'package:mobx/mobx.dart';
part "calculator_state.g.dart";

class CalculatorState extends _CalculatorState with _$CalculatorState {
  CalculatorState();
}

abstract class _CalculatorState with Store{

  Parser parser = Parser();
  ContextModel cm = ContextModel();

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
    if(isLastOneIsOperator() || this.userInput.isEmpty){
      return;
    }

   Expression exp =  parser.parse(this.userInput);
   this.answer = exp.evaluate(EvaluationType.REAL, cm).toString();

  }

  @action
  void resultPlusMinus(){
    if(isLastOneIsOperator() || this.userInput.isEmpty){
      return;
    }

    Expression exp =  parser.parse(this.userInput);
    this.answer = exp.evaluate(EvaluationType.REAL, cm).toString();

    var d = 0.0;
    d = exp.evaluate(EvaluationType.REAL, cm);
    d *= -1;
    this.answer = d.toString();

  }

  @action
  void resultPercentage(){
    if(isLastOneIsOperator() || this.userInput.isEmpty){
      return;
    }

    Expression exp =  parser.parse(this.userInput);
    this.answer = exp.evaluate(EvaluationType.REAL, cm).toString();

    var d = 0.0;
    d = exp.evaluate(EvaluationType.REAL, cm);
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
     if ( userInput.isNotEmpty && list.contains(userInput.substring( userInput.length - 1)) && list.contains(inputChar)){
       return true;
     }else{
       return false;
     }
   }

    isLastOneIsOperator() {
    var list = ["/", "%" , "*", "+", "-"];
    if ( userInput.isNotEmpty && list.contains(userInput.substring( userInput.length - 1))){
      return true;
    }else{
      return false;
    }
  }

  _isFirstOneIsOperator(String inputChar) {
    var list = ["/", "%" , "*", "+", "-", "+/-"];
    if (this.userInput.isEmpty && list.contains(inputChar)){
      return true;
    }else{
      return false;
    }
  }


}