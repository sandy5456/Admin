import 'dart:io';

class StateManagmentData {
  int itemcatogery;
  File image;
  setImageValue(File value) {
    image = value;
  }
  setitemCatageryvalue(int value){
    itemcatogery=value;
  }
}

final stateManagmentData = StateManagmentData();
