import 'package:calculator_app/Global.dart';
import 'package:calculator_app/CalculatorUIGenerator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator App',
      theme: SchedulerBinding.instance!.window.platformBrightness == Brightness.dark ? ThemeData.dark() : ThemeData.light(), //MediaQuery.of(context).platformBrightness == Brightness.dark ?  {calculator.themeIsDark = true, ThemeData.dark()} : {calculator.themeIsDark = false, ThemeData.light()},//calculator.themeIsDark ? ThemeData.dark() : ThemeData.light(),  //mytheme.currentTheme(),

      home:   MyHomePage(),
    );

  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SchedulerBinding.instance!.window.platformBrightness == Brightness.dark ? calculator.themeIsDark = true : calculator.themeIsDark = false ;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(

          child:
          Observer(
            builder: (_) =>
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                  child: userInputAndAnswerContainer()
              ),
              Expanded(
                child: Container(
                 height: MediaQuery.of(context).size.height * 0.6,
                  child: buttonsGrid(),

                ),
              ),

            ],
          ),
        ),
        ),
      ),
    );
  }


}

