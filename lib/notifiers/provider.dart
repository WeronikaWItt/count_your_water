

import 'dart:collection';

import 'package:flutter/cupertino.dart';

class DataNotifier with ChangeNotifier{
  List<Data> _dataList=[];

  UnmodifiableListView <Data> get dataList=> UnmodifiableListView(_dataList);

  void addData(Data data){
    _dataList.add(data);
    notifyListeners();
  }
}