import 'package:calculator_app/Global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class NeumorphicContainer extends StatefulWidget {
  final double bevel;
  final Offset blurOffset;
  final Color color;
  String label = "";

  NeumorphicContainer({
    Key? key,
    required this.label,
    this.bevel = 5.0,
    required this.color,
  })  : this.blurOffset = Offset(bevel / 2, bevel / 2),
        super(key: key);

  @override
  _NeumorphicContainerState createState() => _NeumorphicContainerState();
}

class _NeumorphicContainerState extends State<NeumorphicContainer> {
  bool _isPressed = false;

    void onTapDown(TapDownDetails details) {
      setState(() {
        print("_onTapDown");

        buttonTap(this.widget.label);
        _isPressed = true;
      });
    }
    void _onTapUp(TapUpDetails details) {
      setState(() {
        print("_onTapUp");

        _isPressed = false;
      });
    }


    void buttonTap(String label){

    switch (label) {
      case 'AC':
        calculator.clean();
        break;
      case 'D':
        calculator.delete();
        break;
      case '=':
        calculator.result();
        break;

      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case '0':
      case '+':
      case '-':
      case '/':
        calculator.addUserInput(label);
        break;
      case 'x':
        calculator.addUserInput("*");
        break;


    }


    }

  @override
  Widget build(BuildContext context) {
    final color = this.widget.color; //?? Theme.of(context).backgroundColor;


    return GestureDetector(
      onTapDown: onTapDown,
      onTapUp: _onTapUp,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),  //.circular(widget.bevel * 10),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                _isPressed ? color : color.mix(Colors.black, .1),
                _isPressed ? color.mix(Colors.black, .05) : color,
                _isPressed ? color.mix(Colors.black, .05) : color,
                color.mix(Colors.white, _isPressed ? .2 : .5),
              ],
              stops: [
                0.0,
                .3,
                .6,
                1.0,
              ]),
          boxShadow: _isPressed ? null : [
            BoxShadow(
              blurRadius: widget.bevel,
              offset: -widget.blurOffset,
              color: color.mix(Colors.white, .6),
            ),
            BoxShadow(
              blurRadius: widget.bevel,
              offset: widget.blurOffset,
              color: color.mix(Colors.black, .3),
            )
          ],
        ),
        child: Container(alignment: Alignment.center, height: 20, width: 20, child: Text(widget.label, style: TextStyle(fontSize: 14),),), //Typography.blackCupertino.display2
      ),
    );
  }
}

extension ColorUtils on Color {
  Color mix(Color another, double amount) {
    return Color.lerp(this, another, amount)!;
  }
}