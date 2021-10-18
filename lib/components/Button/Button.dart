import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetButton {
  void RadioButton (Function onTap, Color? color, Widget TextField) {
    color = color ??  Colors.yellow;
    RadioButton(onTap, color, TextField);
  }
}

class ArcButton extends StatefulWidget{
  Function onTap;
  Color color;
  Widget TextField;
  double? width;
  double? height;
  ArcButton({Key? key, required this.onTap, required this.color, required this.TextField, this.width, this.height }): super(key:key);
  @override
  _ArcButton createState() => _ArcButton();
}
class _ArcButton extends State<ArcButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap();
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.0,
            color: Colors.transparent,
          ),
          color: widget.color,
          borderRadius: const BorderRadius.all(const Radius.circular(40.0)),
        ),
        child: Center(
          child: widget.TextField
        ),
      ),
    );
  }
}