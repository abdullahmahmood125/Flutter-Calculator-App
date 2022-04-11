import 'package:calculator_app/Global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class ButtonContainer extends StatefulWidget {
  final double bevel;
  final Offset blurOffset;
  final Color color;
  String label = "";
   Color textColor = Colors.black;
   final VoidCallback onTap;

  ButtonContainer({
    Key? key,
    required this.label,
    this.bevel = 5.0,
    required this.color,
    required this.textColor,
    required this.onTap
  })  : this.blurOffset = Offset(bevel / 3, bevel / 3),
        super(key: key);

  @override
  _ButtonContainerState createState() => _ButtonContainerState();
}

class _ButtonContainerState extends State<ButtonContainer> {
  bool _isPressed = false;

    void onTapDown(TapDownDetails details) {
      setState(() {
        //buttonTap(this.widget.label);
        _isPressed = true;
      });
      this.widget.onTap();
    }
    void _onTapUp(TapUpDetails details) {
      setState(() {
        _isPressed = false;
      });
    }


  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final squareSideLength = width / 5;
    final buttonWidth = squareSideLength * (widget.label == "0" ? 2.2 : 1);
    final buttonSize = Size(buttonWidth, squareSideLength);

    return GestureDetector(
      onTapDown: onTapDown,
      onTapUp: _onTapUp,
      child: SizedBox(
        height: buttonSize.height ,
        width: buttonSize.width,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          //padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color:  _backgroundColor(),
            border: _borderColor(),
            borderRadius: BorderRadius.circular(widget.bevel * 10),  //.circular(widget.bevel * 10),
            boxShadow: _boxShadow(),
          ),
          child: Center(
            child: Container(alignment: widget.label == "0" ? Alignment(-0.6,0): Alignment.center,
            child: Text(widget.label,
              style: TextStyle(fontSize: 30, color: this.widget.textColor),
              textAlign:  TextAlign.center,
            ),
          ),
          ), //Typography.blackCupertino.display2
        ),
      ),
    );
  }

  _boxShadow() {
    if (_isPressed){
      return null;
    } else{

    if( calculator.themeIsDark){
    return _darkBoxShadow();
    } else{
    return _lightBoxShadow();
    }


    }


  }
  _darkBoxShadow() => [BoxShadow(
    blurRadius: widget.bevel,
    offset: Offset(4.5, 4.5),
    //offset: -widget.blurOffset,
    color: Color.fromRGBO(30, 30, 30, 1,),
  )];

    _lightBoxShadow() =>  [
      BoxShadow(
    blurRadius: widget.bevel,
    offset:  -widget.blurOffset,
    color: this.widget.color.mix(Colors.white, .6),
     ),
      BoxShadow(
    blurRadius: widget.bevel ,
    offset: widget.blurOffset,
    color: this.widget.color.mix(Colors.black, .3),
  )
    ];

  _backgroundColor() {
    if( calculator.themeIsDark){
      return Color.fromRGBO(38, 38, 38, 1);
    }else
    return Color.fromRGBO(239, 238, 238, 1);
  }

  _borderColor() {
    return Border.all(color: calculator.themeIsDark ? Color.fromRGBO(46, 46, 46, 1) : Colors.transparent);
    }


}

extension ColorUtils on Color {
  Color mix(Color another, double amount) {
    return Color.lerp(this, another, amount)!;
  }
}