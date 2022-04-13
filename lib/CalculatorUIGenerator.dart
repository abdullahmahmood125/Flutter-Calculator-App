import 'package:calculator_app/Global.dart';
import 'package:calculator_app/ButtonContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


userInputAndAnswerContainer() => Container(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,

          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(calculator.userInput, style:  TextStyle(fontSize: 20, color:  calculator.themeIsDark ? Colors.white : Colors.black),),
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerRight,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(calculator.answer, style:  TextStyle(fontSize: 55,  color:   calculator.themeIsDark ? Colors.white : Colors.black)),
          ),
        ),
      ),
    ],
  ),
);

buttonsGrid() => Column(
  mainAxisSize: MainAxisSize.max,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonContainer(color: Colors.grey.shade300, label: "AC", textColor: Colors.grey, onTap: () => calculator.clean(), ),
              ButtonContainer(color: Colors.grey.shade300, label: "+/-", textColor: Colors.grey, onTap: () => calculator.resultPlusMinus()),
              ButtonContainer(color: Colors.grey.shade300, label: "%", textColor: Colors.grey , onTap: () => calculator.resultPercentage()),
              ButtonContainer(color: Colors.grey.shade300, label: "÷",  textColor: Colors.orange, onTap: () => calculator.addUserInput("/")),
            ],
          ),
        SizedBox(height: 10,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonContainer(color: Colors.grey.shade300, label: "7", textColor: calculator.themeIsDark ? Colors.white70 :  Colors.black, onTap: () => calculator.addUserInput("7")),
              ButtonContainer(color: Colors.grey.shade300, label: "8", textColor: calculator.themeIsDark ? Colors.white70 :  Colors.black, onTap: () => calculator.addUserInput("8")),
              ButtonContainer(color: Colors.grey.shade300, label: "9",textColor: calculator.themeIsDark ? Colors.white70 :  Colors.black, onTap: () => calculator.addUserInput("9")),
              ButtonContainer(color: Colors.grey.shade300, label: "x", textColor: Colors.orange, onTap: () => calculator.addUserInput("*")),
            ],
          ),

          SizedBox(height: 10,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonContainer(color: Colors.grey.shade300, label: "4",textColor: calculator.themeIsDark ? Colors.white70 :  Colors.black, onTap: () => calculator.addUserInput("4")),
              ButtonContainer(color: Colors.grey.shade300, label: "5",textColor: calculator.themeIsDark ? Colors.white70 :  Colors.black, onTap: () => calculator.addUserInput("5")),
              ButtonContainer(color: Colors.grey.shade300, label: "6",textColor: calculator.themeIsDark ? Colors.white70 :  Colors.black, onTap: () => calculator.addUserInput("6")),
              ButtonContainer(color: Colors.grey.shade300, label: "-",textColor: Colors.orange, onTap: () => calculator.addUserInput("-")),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonContainer(color: Colors.grey.shade300, label: "1", textColor: calculator.themeIsDark ? Colors.white70 :  Colors.black, onTap: () => calculator.addUserInput("1")),
              ButtonContainer(color: Colors.grey.shade300, label: "2",textColor: calculator.themeIsDark ? Colors.white70 :  Colors.black, onTap: () => calculator.addUserInput("2")),
              ButtonContainer(color: Colors.grey.shade300, label: "3",textColor: calculator.themeIsDark ? Colors.white70 :  Colors.black, onTap: () => calculator.addUserInput("3")),
              ButtonContainer(color: Colors.grey.shade300, label: "+",textColor: Colors.orange, onTap: () => calculator.addUserInput("+")),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonContainer(color: Colors.grey.shade300, label: "0",textColor: calculator.themeIsDark ? Colors.white70 :   Colors.black, onTap: () => calculator.addUserInput("0")),
              ButtonContainer(color: Colors.grey.shade300, label: ".", textColor: calculator.themeIsDark ? Colors.white70 :  Colors.black, onTap: () => calculator.addUserInput(".")),
              ButtonContainer(color: Colors.grey.shade300, label: "=",textColor: Colors.orange, onTap: () => calculator.result()),
            ],
          ),

        ],
      ),
    ),

  ],
);
