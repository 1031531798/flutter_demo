import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Avatar extends StatefulWidget{
  String? label;
  String imageSrc;
  Avatar({Key? key, this.label, required this.imageSrc}): super(key:key);

  @override
  _Avatar createState() => _Avatar();
}
class _Avatar extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            // child: ClipOval(
            //   child: Image.asset(widget.imageSrc,
            //     height: 50,
            //     width: 50,
            //     fit: BoxFit.cover,),
            // ),
            child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    widget.imageSrc
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
                widget.label??''
            ),
          ),
        ],
      ),
    );
  }
}