import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet/components/input/arc_input.dart';
import 'package:pet/components/Button/Button.dart';
import 'package:pet/components/Tag/Tag.dart';
import 'package:dio/dio.dart';

class SearchIndex extends StatefulWidget implements PreferredSizeWidget {
  @override
  _SearchIndex createState() => new _SearchIndex();
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(80);
}

class _SearchIndex extends State<SearchIndex> {
  TextEditingController _searchController = TextEditingController();
  void getHistoryList() async {
    const url =
        'http://36.104.146.4:8113/websites-server/rest/frontDesk/getFrontPage';
    try {
      var response = await Dio().post(url);
      print('请求成功');
      print(response);
    } catch (e) {
      print(e);
    }
    print('请求数据');
  }

  // 查询事件
  void searchKeyword(keyword) {
    getHistoryList();
    print(keyword ?? _searchController.text);
  }
  // 清除历史搜索
  clearHistory() {}

  // 生成历史搜索标签
  List<Container> getTagList(list) {
    getTagChild (int index) {
      if (list[index]['icon']) {
        return [Text(list[index]['label']), Padding(
          child: Icon(Icons.local_fire_department, color: Color.fromRGBO(239, 83, 80, 1)),
          padding: EdgeInsets.only(left: 5),
        )];
      }else {
        return [
          Text(list[index]['label'])
        ];
      }
    }
    return List<Container>.generate(
      list.length,
      (int index) => Container(
        padding: EdgeInsets.only(right: 10),
        child: Tag(
            onTap: () {
              searchKeyword(list[index]['label']);
            },
            color: Colors.grey[100],
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: getTagChild(index)
            )),
      ),
    );
  }
  // 搜索框组件
  AppBar renderSearchInput() {
    return AppBar(
      shadowColor: Colors.transparent,
      backgroundColor: Colors.white,
      title: Container(
          child: Row(
        children: [
          Expanded(
            child: ArcInput(
                height: 40,
                textController: _searchController,
                prefix: Icon(Icons.search, color: Colors.grey[600]),
                readOnly: false,
                decoration: InputDecoration(
                  hintText: '搜索宠物/用户',
                  border: InputBorder.none
                ),
                suffix: ArcButton(
                    onTap: searchKeyword,
                    color: Colors.yellow,
                    width: 60,
                    height: 40,
                    TextField: Text(
                      '搜索',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    ))),
          )
        ],
      )),
    );
  }
  // 生成历史搜索
  Widget renderHistory() {
    List list = [
      {'label': '布偶猫', 'icon': true},
      {'label': '无毛猫', 'icon': false},
      {'label': '领养', 'icon': false},
      {'label': '拉布拉多', 'icon': false},
      {'label': '仓鼠', 'icon': false},
      {'label': '螳螂', 'icon': false},
    ];
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('历史搜索',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ArcButton(
                      onTap: clearHistory,
                      color: Colors.grey.shade200,
                      TextField: Icon(Icons.delete_outline))
                ],
              )),
          Wrap(
              spacing: 2, //主轴上子控件的间距
              runSpacing: 10, //交叉轴上子控件之间的间距
              children: getTagList(list))
        ],
      ),
    );
  }
  // 生成推荐查询
  Widget renderReCommend() {
    List list = [
      {'label': '纯种美短 美国短毛猫', 'icon': true},
      {'label': '金毛 拉布拉多', 'icon': false},
      {'label': '私人猫舍低价出售', 'icon': false},
      {'label': '免费领养', 'icon': true},
      {'label': '小白鼠批量出售 实验鼠', 'icon': false},
    ];
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('猜你可能在找',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ],
              )),
          Wrap(
              spacing: 2, //主轴上子控件的间距
              runSpacing: 10, //交叉轴上子控件之间的间距
              children: getTagList(list))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: renderSearchInput(),
        ),
        body: Container(
            child: Column(
          children: [renderHistory(), renderReCommend()],
        )));
  }
}
