import 'package:flutter/material.dart';

class Store with ChangeNotifier {
  int _homePageIndex = 1;
  String _openMessage = 'chushi';
  String _searchText = '';


  void changeHomePageIndex(int index) {
    _homePageIndex = index;
    notifyListeners();
  }
  void changeSearchText (String text) {
    this._searchText = text;
  }
  void setMessage(String id) {
    this._openMessage = id;
  }

  get homePageIndex => _homePageIndex;
  get searchText => _searchText;
  get openMessage => _openMessage;
}
