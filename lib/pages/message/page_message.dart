import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet/utils/NodeRequest.dart';
import './message_header.dart';
import '../../components/Toast.dart';
import 'package:pet/utils/overScroll.dart';
import 'package:pet/components/MessageBox/Message_box.dart';
import 'package:pet/components/input/arc_input.dart';

class PageMessage extends StatefulWidget {
  _PageMessage createState() => new _PageMessage();
}

class _PageMessage extends State<PageMessage> {
  List<dynamic> _messageList = <Map>[];
  void initState() {
    getMessageList();
    // TODO: implement initState
    super.initState();
  }

  void getMessageList() async {
    Response response = await NodeRequest.post(
        'http://139.196.74.115:8796/petApp/message/list', {});
    setState(() {
      _messageList = response.data;
    });
  }

  renderDefaultCell() {
    return new Padding(
      padding: EdgeInsets.all(10),
      child: new Column(
        children: [
          ArcInput(
            readOnly: true,
            height: 35,
            bgColor: Colors.grey.shade200,
            borderColor: Colors.grey.shade200,
            decoration: InputDecoration(
                hintText: '搜索',
                fillColor: Colors.grey,
                border: InputBorder.none),
          )
        ],
      ),
    );
  }

  renderListView() {
    List<Widget> rowList = [renderDefaultCell()];
    for (int i = 0; i < _messageList.length; i++) {
      var messageItem = _messageList[i];
      rowList.add(Padding(
        padding: EdgeInsets.all(10),
        child: MessageBox(
          avatarImage: messageItem['avatarImage'],
          goodsImage: messageItem['goodsImage'],
          title: Row(
            children: [
              Text(messageItem['title'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
            ],
          ),
          content: messageItem['content'],
          dateTime: messageItem['datetime'],
          onTap: () {
            Navigator.of(context).pushNamed('/chat', arguments: {
              'id': i,
              'title': messageItem['title'],
              'message': [messageItem['content']],
              'avatar': messageItem['avatarImage'],
              'goodsImage': messageItem['goodsImage']
            });
          },
        ),
      ));
    }
    return rowList;
  }

  Future refreshList() async {
    const timeout = const Duration(seconds: 1);
    Timer(timeout, () {
      //callback function
      Toast.toast(context, msg: "刷新成功");
    });
  }

  Future loadList() async {
    const timeout = const Duration(seconds: 1);
    Timer(timeout, () {
      //callback function
      Toast.toast(context, msg: "加载成功");
    });
  }

  void settingMessage(int index) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: MessageHeader(setting: settingMessage),
        body: ScrollConfiguration(
          child: ListView(
            children: renderListView(),
          ),
          behavior: OverScrollBehavior(),
        ));
  }
}
