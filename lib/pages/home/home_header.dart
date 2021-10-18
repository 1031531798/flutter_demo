import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../stateManage.dart';
import '../search/search_index.dart';
import 'package:pet/components/Button/Button.dart';
import 'package:pet/components/input/arc_input.dart';
class HomeHeader extends StatefulWidget implements PreferredSizeWidget {
  int pageIndex;
  final changePage;
  HomeHeader({Key? key, required this.pageIndex, required this.changePage})
      : super(key: key);

  @override
  _HomeHeader createState() => new _HomeHeader();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}

class _HomeHeader extends State<HomeHeader> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  void goSearchPage () {
    Navigator.of(context).pushNamed('/searchPage');
  }

  Widget renderSearch() {
    return ArcInput(
      width: 280,
      height: 40,
      readOnly: true,
      onTap: goSearchPage,
      decoration: InputDecoration(
          hintText: '宠物店 品种 卖家名 产地',
          border: InputBorder.none),
      prefix: Icon(Icons.qr_code_scanner, color: Colors.grey[600]),
      suffix: ArcButton(onTap: goSearchPage, color: Colors.yellow, TextField: Text('搜索', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),width: 70,height: 40,),
    );
  }

  Widget renderTitle() {
    return Theme(
      child: Container(
        height: 45,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: InkWell(
                  onTap: () {
                    Provider.of<Store>(context, listen: false)
                        .changeHomePageIndex(0);
                    // final index =
                    //     Provider.of<Store>(context, listen: false).homePageIndex;
                    widget.changePage(0);
                  },
                  child: AnimatedDefaultTextStyle(
                    duration: Duration(milliseconds: 200),
                    style: widget.pageIndex == 0
                        ? TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)
                        : TextStyle(fontSize: 14, color: Colors.grey[500]),
                    child: Text(
                        '订阅'
                    ),
                  )
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  // setState(() {
                  //   widget.pageIndex = 1;
                  // });
                  widget.changePage(1);
                },
                child: Text(
                  '推荐',
                  style: widget.pageIndex == 1
                      ? TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                      : TextStyle(fontSize: 14, color: Colors.grey[500]),
                ),
              ),
            ),
          ],
        ),
      ),
      data: ThemeData(
        brightness: Theme.of(context).brightness,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.white,
      flexibleSpace: Padding(
        padding: EdgeInsets.only(top: 25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [renderTitle(), renderSearch()],
        ),
      ),
    );
  }
}
