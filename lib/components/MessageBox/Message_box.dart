import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageBox extends StatefulWidget {
  Function onTap;
  String avatarImage;
  String goodsImage;
  Widget title;
  String content;
  String dateTime;
  MessageBox(
      {Key? key,
      required this.onTap,
      required this.avatarImage,
      required this.goodsImage,
      required this.title,
      required this.content,
      required this.dateTime})
      : super(key: key);
  @override
  _MessageBox createState() => _MessageBox();
}

class _MessageBox extends State<MessageBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap();
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
          height: 100,
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            children: [
              CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(widget.avatarImage)),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: widget.title,
                      ),
                      Container(
                        child: Text(
                          widget.content,
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        child: Text(widget.dateTime,
                            style: TextStyle(
                                color: Colors.grey[500], fontSize: 12)),
                      ),
                    ],
                  ),
                ),
              ),
              Image.network(widget.goodsImage, fit: BoxFit.cover),
            ],
          )),
    );
  }
}
