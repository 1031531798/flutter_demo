import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageHeader extends StatefulWidget implements PreferredSizeWidget {
  final setting;
  MessageHeader({Key? key, required this.setting})
      : super(key: key);
  @override
  _MessageHeader createState() => new _MessageHeader();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}

class _MessageHeader extends State<MessageHeader> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.transparent,
      centerTitle: true,
      title: Theme(
        child: Center(
          child: Text('消息', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
        ),
        data: ThemeData(
          brightness: Theme.of(context).brightness,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
      ),
      actions: [
        Container(
          padding:EdgeInsets.only(right: 10),
          child: InkWell(
            child: Icon(Icons.miscellaneous_services, color: Colors.grey[800],),
          )
        )
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.white,
            Colors.white,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
      ),
    );
  }
}
