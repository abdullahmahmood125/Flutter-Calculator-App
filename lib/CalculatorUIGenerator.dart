import 'package:calculator_app/Button.dart';
import 'package:calculator_app/Global.dart';
import 'package:calculator_app/ButtonContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


userInputAndAnswerContainer() => Container(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.centerLeft,
        child: Text(calculator.userInput, style:  TextStyle(fontSize: 20),),
      ),
      Container(
        padding: EdgeInsets.all(50),
        alignment: Alignment.centerRight,
        child: Text(calculator.answer, style:  TextStyle(fontSize: 25)),
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
              ButtonContainer(color: Colors.grey.shade300, label: "AC",),
              ButtonContainer(color: Colors.grey.shade300, label: "D",),
              ButtonContainer(color: Colors.grey.shade300, label: "%",),
              ButtonContainer(color: Colors.grey.shade300, label: "/",),
            ],
          ),
        SizedBox(height: 10,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonContainer(color: Colors.grey.shade300, label: "7",),
              ButtonContainer(color: Colors.grey.shade300, label: "8",),
              ButtonContainer(color: Colors.grey.shade300, label: "9",),
              ButtonContainer(color: Colors.grey.shade300, label: "x",),
            ],
          ),

          SizedBox(height: 10,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonContainer(color: Colors.grey.shade300, label: "4",),
              ButtonContainer(color: Colors.grey.shade300, label: "5",),
              ButtonContainer(color: Colors.grey.shade300, label: "6",),
              ButtonContainer(color: Colors.grey.shade300, label: "-",),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonContainer(color: Colors.grey.shade300, label: "1",),
              ButtonContainer(color: Colors.grey.shade300, label: "2",),
              ButtonContainer(color: Colors.grey.shade300, label: "3",),
              ButtonContainer(color: Colors.grey.shade300, label: "+",),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonContainer(color: Colors.grey.shade300, label: "+/-",),
              ButtonContainer(color: Colors.grey.shade300, label: "0",),
              ButtonContainer(color: Colors.grey.shade300, label: ",",),
              ButtonContainer(color: Colors.grey.shade300, label: "=",),
            ],
          ),
        ],
      ),
    ),

  ],
);



// var calcGrid = [
//
//   Row(
//     children: [
//     Button.orange( label: "AC", onTap: () => { calculator.clean()}),
//     Button.red( label: "DEL", onTap: () => { calculator.delete()}),
//     Button.blue( label: "%", onTap: () => {}),
//     Button.blue( label: "/", onTap: () => {calculator.addUserInput("/")})
//   ],),
//
//   Row(
//     children: [
//     Button.grey( label: "7", onTap: () => {calculator.addUserInput("7")}),
//     Button.grey( label: "8", onTap: () => {calculator.addUserInput("8")}),
//     Button.grey( label: "9", onTap: () => {calculator.addUserInput("9")}),
//     Button.blue( label: "x", onTap: () => {calculator.addUserInput("*")}),
//   ],),
//
//   Row(
//     children: [
//     Button.grey( label: "4", onTap: () => {calculator.addUserInput("4")}),
//     Button.grey( label: "5", onTap: () => {calculator.addUserInput("5")}),
//     Button.grey( label: "6", onTap: () => {calculator.addUserInput("6")}),
//     Button.blue( label: "-", onTap: () => {calculator.addUserInput("-")}),
//   ],),
//
//   Row(
//     children: [
//       Button.grey( label: "1", onTap: () => {calculator.addUserInput("1")}),
//       Button.grey( label: "2", onTap: () => {calculator.addUserInput("2")}),
//       Button.grey( label: "3", onTap: () => {calculator.addUserInput("3")}),
//       Button.blue( label: "+", onTap: () => {calculator.addUserInput("+")}),
//     ],),
//
//   Row(
//     children: [
//       Button.blue( label: "+/-", onTap: () => {}),
//       Button.grey( label: "0", onTap: () => {calculator.addUserInput("0")}),
//       Button.blue( label: ",", onTap: () => {}),
//       Button.blue( label: "=", onTap: () => {calculator.result()}),
//     ],)
//
// ];

// var calcGrid = [
//
//   Button.orange( label: "AC", onTap: () => { calculator.clean()}),
//   Button.red( label: "DEL", onTap: () => { calculator.delete()}),
//   Button.blue( label: "%", onTap: () => {}),
//   Button.blue( label: "/", onTap: () => {calculator.addUserInput("/")}),
//   Button.grey( label: "7", onTap: () => {calculator.addUserInput("7")}),
//   Button.grey( label: "8", onTap: () => {calculator.addUserInput("8")}),
//   Button.grey( label: "9", onTap: () => {calculator.addUserInput("9")}),
//   Button.blue( label: "x", onTap: () => {calculator.addUserInput("*")}),
//   Button.grey( label: "4", onTap: () => {calculator.addUserInput("4")}),
//   Button.grey( label: "5", onTap: () => {calculator.addUserInput("5")}),
//   Button.grey( label: "6", onTap: () => {calculator.addUserInput("6")}),
//   Button.blue( label: "-", onTap: () => {calculator.addUserInput("-")}),
//   Button.grey( label: "1", onTap: () => {calculator.addUserInput("1")}),
//   Button.grey( label: "2", onTap: () => {calculator.addUserInput("2")}),
//   Button.grey( label: "3", onTap: () => {calculator.addUserInput("3")}),
//   Button.blue( label: "+", onTap: () => {calculator.addUserInput("+")}),
//   Button.blue( label: "+/-", onTap: () => {}),
//   Button.grey( label: "0", onTap: () => {calculator.addUserInput("0")}),
//   Button.blue( label: ",", onTap: () => {}),
//   Button.blue( label: "=", onTap: () => {calculator.result()}),
//
// ];