import 'dart:io';

class StateManagmentData {
  int itemcatogery;
  File image;
  var todayOrderCount;
  settodayOrderCounr(var value){
todayOrderCount=value;
  }
  setImageValue(File value) {
    image = value;
  }
  setitemCatageryvalue(int value){
    itemcatogery=value;
  }
}

final stateManagmentData = StateManagmentData();
