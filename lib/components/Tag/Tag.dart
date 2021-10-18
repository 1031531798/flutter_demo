import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tag extends StatefulWidget {
  double? radius;
  Color? color = Colors.grey[200];
  Widget child = Text('Tag');
  Function? onTap;
  Tag({Key? key, this.radius, required this.child, this.color, this.onTap})
      : super(key: key);

  @override
  _Tag createState() => _Tag();
}

class _Tag extends State<Tag> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap!();
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: const BorderRadius.all(const Radius.circular(40.0)),
        ),
        child: widget.child
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}
