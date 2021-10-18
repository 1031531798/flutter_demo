import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet/components/Avatar/avatar.dart';
import 'package:pet/utils/overScroll.dart';
import 'package:pet/utils/NodeRequest.dart';
import 'package:pet/components/Goods/good_card.dart';

class PageConcern extends StatefulWidget {
  @override
  _PageConcern createState() => _PageConcern();
}

class _PageConcern extends State<PageConcern> {
  int _channel = 0;
  List<dynamic> _typeList = <Map>[];
  @override
  void initState() {
    getTypeData();
    // TODO: implement initState
    super.initState();
  }

  void getTypeData() async {
    Response response = await NodeRequest.get('http://139.196.74.115:8796/petApp/typeList');
    setState(() {
      _typeList = response.data;
    });
  }
  List<Container> getTypeList() {
    return List<Container>.generate(
      _typeList.length,
      (int index) => Container(
        child: InkWell(
            onTap: () {},
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Avatar(
              imageSrc: _typeList[index]['src'],
              label: _typeList[index]['label'],
            )),
      ),
    );
  }

  Widget renderTypeGoods() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.34,
      color: Color(0xFFFBFCFC),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, left: 10, bottom: 20),
              child: Row(
                children: [
                  Text(
                    "分类导航",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
            Expanded(
                child: GridView.count(
              crossAxisCount: 4,
              physics: const NeverScrollableScrollPhysics(),
              //上下左右的内边距
              mainAxisSpacing: 20.0,
              //主轴元素间距
              crossAxisSpacing: 4.0,
              //次轴元素间距
              children: getTypeList(),
            ))
          ],
        ),
      ),
    );
  }

  Widget renderTabBar() {
    List list = [
      {
        'label': '精选推荐',
      },
      {
        'label': '美短',
      },
      {
        'label': '拉布拉多',
      },
      {
        'label': '布偶猫',
      },
      {
        'label': '橘猫',
      },
      {
        'label': '牧羊犬',
      },
      {
        'label': '热带鱼',
      },
    ];
    print(list);
    TextStyle activeStyle = TextStyle(
        fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black);
    TextStyle dimStyle = TextStyle(fontSize: 14, color: Colors.grey[500]);
    List<Widget> barList = [];
    for (int i = 0; i < list.length; i++) {
      barList.add(InkWell(
          onTap: () {
            setState(() {
              _channel = i;
            });
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
              padding: EdgeInsets.all(10),
              child: AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 200),
                  style: _channel == i ? activeStyle : dimStyle,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Container(
                        height: 50,
                        child: Align(
                          child: Text(
                            list[i]['label'],
                          ),
                          alignment: Alignment.center,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 6),
                        child: _channel == i
                            ? Icon(
                                IconData(0xe601, fontFamily: 'iconfont'),
                                color: Colors.yellow,
                                size: 30,
                              )
                            : Icon(null),
                      )
                    ],
                  )))));
    }
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 50,
                child: ScrollConfiguration(
                  behavior: OverScrollBehavior(),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        children: barList,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: 40,
              height: 50,
              padding: EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-10.0, 0.0),
                    blurRadius: 5.0,
                  )
                ],
                color: Colors.white,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Icon(Icons.menu, color: Color(0xFF909497)),
              ),
            )
          ],
        ));
  }

  renderGoodList() {
    Widget defalutStore (String imgSrc,String name) {
      return Row(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            child: CircleAvatar(
                radius: 12,
                backgroundImage: NetworkImage(
                    imgSrc
                )
            ),
          ),
          Container(
            child: Text(name, style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),overflow: TextOverflow.ellipsis,),
          )
        ],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Wrap(
          children: [
            GoodCard(
                title: '布偶猫幼猫纯种赛级',
                imageUrl:
                    'https://g-search1.alicdn.com/img/bao/uploaded/i4/imgextra/i2/12559359/O1CN01PRsswn2J0TQ03tyxx_!!0-saturn_solar.jpg_580x580Q90.jpg_.webp',
                bottomSlot: defalutStore(
                    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.hpdog.com%2Fuploads%2Fallimg%2F150706%2F3-150F6204033.jpg&refer=http%3A%2F%2Fwww.hpdog.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1636793575&t=a2ba5e092c834cf57850ce4bcd80e234',
                    '圣宠宠物'
                ),
                price: '6800',
                count: '已销19'),
            GoodCard(
                title: '纯种拉布拉多幼犬 导盲犬 小七寻回犬',
                imageUrl:
                    'https://g-search1.alicdn.com/img/bao/uploaded/i4/imgextra/i3/411900046/O1CN01SF88vG1CD6vgxkNko_!!2-saturn_solar.png_580x580Q90.jpg_.webp',
                price: '800',
                bottomSlot: defalutStore(
                    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic.jvrong.com%2F5ccd13370c2bbae315d154276bb936ed.jpg&refer=http%3A%2F%2Fpic.jvrong.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1636793575&t=6062d48b65201318807474efd45dba5b',
                    '奥其乐'
                ),
                count: '已销22'),
            GoodCard(
                title: '纯种英短蓝白美短银渐层布偶金吉拉蓝猫',
                imageUrl:
                    'https://g-search1.alicdn.com/img/bao/uploaded/i4/imgextra/i3/671700111/O1CN01zJeesQ1CgsfozO13B_!!0-saturn_solar.jpg_580x580Q90.jpg_.webp',
                price: '300',
                bottomSlot: defalutStore(
                    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fp1.pccoo.cn%2Fyp%2F20131025%2F201310251206360692.jpg&refer=http%3A%2F%2Fp1.pccoo.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1636793575&t=860f267887f3986afcc0a7a5e4153e88',
                    'CC宠物店'
                ),
                count: '已销5')
          ],
        )),
        Expanded(
            child: Wrap(
          children: [
            GoodCard(
                imageUrl:
                    'https://hbimg.huabanimg.com/d42218d1acc600b2a9cd55b79bb0cc3bd3cea6197e8a-6Vsp3Y_fw658/format/webp'),
            GoodCard(
              title: '正规猫舍专业指导',
              imageUrl:
                  'https://g-search1.alicdn.com/img/bao/uploaded/i4/imgextra/i3/376390199/O1CN016x2aeN1DLBS3Xxn2V_!!0-saturn_solar.jpg_580x580Q90.jpg_.webp',
              price: '320',
              bottomSlot: defalutStore(
                  'https://img0.baidu.com/it/u=2105138492,3240808579&fm=26&fmt=auto',
                  '英泰猫舍'
              ),
              count: '5人表示喜欢',
            ),
            GoodCard(
              title: '澳洲蜜袋鼬幼崽蜜袋鼯小飞鼠幼崽宝宝蜜袋鼠萌宠网红小蜜',
              imageUrl:
                  'https://g-search1.alicdn.com/img/bao/uploaded/i4/imgextra/i4/390650150/O1CN01Y8llTW1Cyk1poNpz2_!!0-saturn_solar.jpg_580x580Q90.jpg_.webp',
              price: '450',
              bottomSlot: defalutStore(
                  'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fqcloud.dpfile.com%2Fpc%2FcMEy-eHj4AeHKfLGLypQxIjo0BfBTWdtYVd8EkukWshWniVC1RDTZfxMS7SFPEJDjoJrvItByyS4HHaWdXyO_DrXIaWutJls2xCVbatkhjUNNiIYVnHvzugZCuBITtvjski7YaLlHpkrQUr5euoQrg.jpg&refer=http%3A%2F%2Fqcloud.dpfile.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1636794236&t=bf41cdf13deadb3ce579c3ab467711f4',
                  '淘喵喵cafe'
              ),
              count: '同类销量第5',
            )
          ],
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: ScrollConfiguration(
          behavior: OverScrollBehavior(),
          child: ListView(
            children: [renderTypeGoods(), renderTabBar(), renderGoodList()],
          ),
        ));
  }
}
