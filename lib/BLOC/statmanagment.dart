import 'dart:io';

class StateManagmentData {
  String itemcatogery;
  File image;
  setImageValue(File value) {
    image = value;
  }
  setitemCatageryvalue(String value){
    itemcatogery=value;
  }
}

final stateManagmentData = StateManagmentData();
