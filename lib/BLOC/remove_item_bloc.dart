

import 'package:kafe/JSON/repository/repository.dart';

import 'package:rxdart/rxdart.dart';

class RemoveItemBloc {
  final _repository = Repository();


 

  removeitem(var productId,) {
    _repository.removeProduct(productId);
  }


}

final removeItemBloc = RemoveItemBloc();