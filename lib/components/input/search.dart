import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class searchComponents extends StatefulWidget {
  double width = 280;
  double height = 40;
  String hintText = '机械革命 蛟龙5 3060满血版 游戏机笔记本';

  @override
  _searchComponents createState() => _searchComponents();
}

class _searchComponents extends State<searchComponents>{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.0,
            color: Colors.orange,
          ),
          borderRadius:
          const BorderRadius.all(const Radius.circular(40.0)),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: TextField(
            onTap: () {
              Navigator.of(context).pushNamed('/searchPage');
            },
            decoration: InputDecoration(
                hintText: widget.hintText,
                border: InputBorder.none),
            readOnly: true,
            cursorWidth: 1.0,
            style: TextStyle(
              color: Color(0xFF4A4A4A),
              fontSize: 14.0,
            ),
          ),
        )
    );
  }
}