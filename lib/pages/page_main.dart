import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet/pages/home/page_home.dart';
import 'package:pet/pages/message/page_message.dart';

class PageMain extends StatefulWidget {
  @override
  _PageMain createState() => new _PageMain();
}

class _PageMain extends State<PageMain> {
  int _selectIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  // tabBottom config 底部配置
  final _list = <Map>[
    {
      'icon': IconData(0xe696, fontFamily: 'iconfont'),
      'fill': IconData(0xe713, fontFamily: 'iconfont'),
      'label': '首页'
    },
    {
      'icon': IconData(0xe6b1, fontFamily: 'iconfont'),
      'fill': IconData(0xe6b2, fontFamily: 'iconfont'),
      'label': '会玩'
    },
    {'label': 'float'},
    {'icon': Icons.mail_outline, 'fill': Icons.drafts, 'label': '消息'},
    {
      'icon': IconData(0xe70e, fontFamily: 'iconfont'),
      'fill': IconData(0xe715, fontFamily: 'iconfont'),
      'label': '我的'
    },
  ];
  // 渲染底部組件
  List<Widget> _randerButtomBar() {
    List<Widget> tabs = [];
    for (int i = 0; i < _list.length; i++) {
      if (_list[i]['label'] == 'float') {
        tabs.add(Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.home,
              color: Colors.transparent,
            ),
            Text("", style: TextStyle(color: Color(0xFFEEEEEE)))
          ],
        ));
      } else {
        tabs.add(Container(
            height: 60,
            child: InkWell(
              onTap: () {
                setState(() {
                  _selectIndex = i;
                });
                _onItemTapped(i);
              },
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _selectIndex == i ? _list[i]['fill'] : _list[i]['icon'],
                      color:
                          _selectIndex == i ? Colors.orange[800] : Colors.grey,
                    ),
                    Text(
                      _list[i]['label'],
                      style: TextStyle(
                          fontSize: 12,
                          color: _selectIndex == i
                              ? Colors.orange[800]
                              : Colors.grey),
                    )
                  ],
                ),
              ),
            )));
      }
    }
    return tabs;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    ///页面销毁时，销毁控制器
    super.dispose();
  }

  _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
    var ww = MediaQuery.of(context).size.width * index;
    _pageController.jumpTo(ww);
    print(ww);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: PageView(
          controller: _pageController,
          children: <Widget>[
            new PageHome(),
            Center(
              child: Text('会玩展示短视频'),
            ),
            Center(
              child: Text('center slot'),
            ),
            Center(
              child: PageMessage(),
            ),
            Center(
              child: Text('我的页面'),
            )
          ],
          onPageChanged: (index) {
            ///页面触摸作用滑动回调，用于同步tab选中状态
            setState(() {
              _selectIndex = index;
            });
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          onPressed: () {
            print('点击中间的浮动按钮');
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Theme(
          child: BottomAppBar(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _randerButtomBar(),
              ),
              color: Colors.white,
              shape: CircularNotchedRectangle()),
          data: ThemeData(
            brightness: Theme.of(context).brightness,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ));
  }
}
