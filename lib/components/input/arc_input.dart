import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArcInput extends StatefulWidget {
  Function? onTap;
  Color borderColor;
  Color bgColor;
  Widget? prefix;
  Widget? suffix;
  double? width = 300;
  double? height = 40;
  bool readOnly;
  InputDecoration? decoration = InputDecoration(
      border: InputBorder.none
  );
  TextEditingController? textController = TextEditingController();
  ArcInput({
    Key? key,
    required this.readOnly,
    this.textController,
    this.decoration,
    this.width,
    this.height,
    this.onTap,
    this.bgColor: Colors.white,
    this.borderColor: Colors.yellow,
    this.suffix,
    this.prefix,
  })
      : super(key: key);
  @override
  _ArcInput createState() => _ArcInput();
}

class _ArcInput extends State<ArcInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(5),
        child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: widget.bgColor,
              border: Border.all(
                width: 2.0,
                color: widget.borderColor,
              ),
              borderRadius: const BorderRadius.all(const Radius.circular(40.0)),
            ),
            child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Container(
                      child: widget.prefix,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: TextField(
                          controller: widget.textController,
                          onTap: () {
                            if (widget.onTap != null) {
                              widget.onTap!();
                            }
                          },
                          decoration: widget.decoration,
                          readOnly: widget.readOnly,
                          cursorWidth: 1.0,
                          style: TextStyle(
                            color: Color(0xFF4A4A4A),
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: widget.suffix,
                    )
                  ],
                ))));
  }
}
