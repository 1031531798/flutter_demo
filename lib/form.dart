import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class MyForm extends StatefulWidget{
  @override
  _FormBody createState() => new _FormBody();
}

class _FormBody extends State<MyForm> {
  final TextEditingController _controller = new TextEditingController();
  final TextEditingController _startDate = new TextEditingController();
  final RestorableDateTime _selectedDate = RestorableDateTime(DateTime(2021, 7, 25));

  @override
  Widget build (BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(16),
      child: new Form(
          child: new Column(
            children: [
              new TextField(
                controller: _controller,
                decoration: new InputDecoration(
                  hintText: '想去的地方',
                  prefixIcon: Icon(Icons.room)
                ),
              ),
              new TextField(
                onTap: () {
                  showDatePicker(
                      context: context,
                      locale: Locale('zh', 'CH'),
                      initialDate: new DateTime.now(),
                      firstDate: new DateTime(2021),
                      lastDate: new DateTime(2022));
                  print(context);
                },
                controller: _startDate,
                decoration: new InputDecoration(
                    hintText: '什么时候出发?',
                    prefixIcon: Icon(Icons.query_builder)
                ),
              )
            ],
          )
      ),
    );
  }
}