import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoodCard extends StatefulWidget {
  String? title;
  String imageUrl;
  Widget? titleDesc;
  Widget? bottomSlot;
  String? price;
  String? count;
  dynamic onTap;

  GoodCard(
      {Key? key,
      this.title,
      required this.imageUrl,
      this.titleDesc,
      this.price,
      this.bottomSlot,
      this.count,
      this.onTap})
      : super(key: key);

  @override
  _GoodCard createState() => _GoodCard();
}

class _GoodCard extends State<GoodCard> {
  renderTitle() {
    if (widget.title != null) {
      return Padding(
        padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
        child: Row(
          children: [
            Expanded(
                child: Text(
              widget.title!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ))
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  renderPrice() {
    List<Widget> defaultChild = [];
    if (widget.price != null) {
      defaultChild.add(Container(
        padding: EdgeInsets.only(left: 5,right: 5),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.end,
          children: [
            Container(
              child: Icon(IconData(0xe6eb, fontFamily: 'iconfont'),
                  color: Colors.redAccent, size: 14),
            ),
            Text(
              widget.price!,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent),
            )
          ],
        ),
      ));
    }
    if (widget.count != null) {
      defaultChild.add(Expanded(
        child: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(5),
            child: Text(
              widget.count!,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            )),
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: defaultChild,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap!();
          }
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(5)),
            clipBehavior: Clip.antiAlias,
            child: Container(
              child: Column(
                children: [
                  // 商品图片
                  Container(
                    child: Image.network(widget.imageUrl, fit: BoxFit.cover),
                  ),
                  // 商品标题
                  renderTitle(),
                  // 商品标签
                  Container(
                    child: widget.titleDesc,
                  ),
                  renderPrice(),
                  Container(
                    child: widget.bottomSlot,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
