import 'dart:async';

import 'package:kafe/JSON/repository/repository.dart';




class AddItemBloc {
  final _repository = Repository();

addItemPost(var id,name, price, offer,  image) {
    _repository.additemPost(id,name, price, offer, image);
  }
  
}

final additemBloc = AddItemBloc();