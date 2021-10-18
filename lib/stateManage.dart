import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Store with ChangeNotifier {
  int _homePageIndex;
  String _searchText = '';

  Store(this._homePageIndex);

  void changeHomePageIndex(int index) {
    _homePageIndex = index;
    notifyListeners();
  }
  void changeSearchText (String text) {
    this._searchText = text;
  }

  get homePageIndex => _homePageIndex;
  get searchText => _searchText;
}
