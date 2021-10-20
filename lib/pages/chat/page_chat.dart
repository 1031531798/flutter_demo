import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet/components/Button/Button.dart';
import 'package:pet/components/Tag/Tag.dart';
import 'package:pet/components/input/arc_input.dart';
import 'package:pet/utils/overScroll.dart';

class PageChat extends StatefulWidget {
  Map userInfo = {'name': '小滔滔', 'memberName': '小滔滔911'};
  Map goodInfo = {
    'imgSrc':
        'https://g-search1.alicdn.com/img/bao/uploaded/i1/4286094183/O1CN01IefF9l1glrRAgdtYg_!!0-item_pic.jpg_300x300.jpg',
    'price': 1900.00,
    'freight': 0.00,
    'status': '1'
  };
  @override
  _PageChat createState() => new _PageChat();
}

class _PageChat extends State<PageChat> {
  TextEditingController _chatController = TextEditingController();
  bool showSendBtn = false;
  @override
  initState() {
    super.initState();
  }

  AppBar renderAppBar() {
    dynamic user = ModalRoute.of(context)?.settings.arguments;
    return AppBar(
      backgroundColor: Colors.grey.shade100,
      shadowColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      centerTitle: true,
      title: Container(
        child: Column(
          children: [
            Text(
              user['title'],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              '会员名：${user['title']}',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
            ),
          ],
        ),
      ),
    );
  }

  // 商品信息
  renderGoodInfo() {
    dynamic messageInfo = ModalRoute.of(context)?.settings.arguments;
    print(messageInfo);
    return Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                messageInfo['goodsImage'] != null
                    ? ClipRRect(
                        child: Image.network(
                          messageInfo['goodsImage'],
                          fit: BoxFit.cover,
                          width: 80,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      )
                    : Container(),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 6),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Container(
                              child: Icon(
                                  IconData(0xe6eb, fontFamily: 'iconfont'),
                                  size: 16),
                            ),
                            Text(
                              '500',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Text('含运费0.00元',
                            style: TextStyle(
                                color: Colors.grey.shade500, fontSize: 12)),
                      )
                    ],
                  ),
                )
              ],
            ),
            // 提醒收货
            // ArcButton(
            //     onTap: () {
            //       print('SHOUHUO');
            //     },
            //     color: Colors.yellow.shade500,
            //     TextField: Padding(
            //       padding: EdgeInsets.all(6),
            //       child: Text(
            //         '提醒收货',style: TextStyle(fontSize: 12),
            //       ),
            //     ))
          ],
        ));
  }

  // 聊天内容列表
  renderMessageBody() {
    dynamic arg = ModalRoute.of(context)?.settings.arguments;
    List<dynamic> messageList = arg['message'];
    List<Widget> list = [];
    for (int i = 0; i < messageList.length; i++) {
      bool mainUser = false;
      list.add(Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: mainUser
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Tag(
                    child: Text(messageList[i]),
                    color: Colors.yellow.shade400,
                    radius: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: arg['avatar'] != null
                        ? CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(arg['avatar']))
                        : Container(),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: arg['avatar'] != null
                        ? CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(arg['avatar']))
                        : Container(),
                  ),
                  Tag(
                    child: Text(messageList[i]),
                    color: Colors.white,
                    radius: 8,
                  )
                ],
              ),
      ));
    }
    return ScrollConfiguration(
      child: ListView(children: list),
      behavior: OverScrollBehavior(),
    );
  }

  renderBottomInput() {
    return Container(
      padding: EdgeInsets.only(left: 10, bottom: 10),
      height: 60,
      child: Row(
        children: [
          ArcButton(
            onTap: () {
              print(_chatController.text == '');
            },
            color: Colors.white,
            TextField: Icon(Icons.keyboard_voice),
            height: 30,
            width: 30,
            borderColor: Colors.black,
          ),
          Expanded(
            child: ArcInput(
              readOnly: false,
              textController: _chatController,
              height: 40,
              decoration: InputDecoration(
                  hintText: '想和TA说点什么...', border: InputBorder.none),
              bgColor: Colors.white,
              borderColor: Colors.grey.shade100,
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 5),
            child: Icon(
              Icons.sentiment_satisfied_alt,
              size: 30,
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 5),
            child: _chatController.text == ''?Icon(
              Icons.add_circle_outline,
              size: 30,
            ):ArcButton(
                onTap: () {
                  print('发送');
                },
                height: 30,
                color: Colors.yellow.shade500,
                TextField: Padding(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child: Text(
                    '发送',style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: renderAppBar(),
        bottomNavigationBar: renderBottomInput(),
        body: Container(
            child: Column(
          children: [
            renderGoodInfo(),
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              decoration: BoxDecoration(color: Colors.orange),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: Colors.white,
                    size: 16,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        '注意：以扫二维码/点链接/去微信等名义让你交钱的都是骗子!',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ))
                ],
              ),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(10),
              child: renderMessageBody(),
            ))
          ],
        )));
  }
}
