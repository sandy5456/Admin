import 'dart:async';

import 'package:kafe/JSON/repository/repository.dart';

class EditItemBloc {
  final _repository = Repository();

  editItemPost(
    var cId,productId,name,price,offers,image
  ) {
    _repository.editItemPost(cId,productId,name,price,offers,image);
  }
}

final editItemBloc = EditItemBloc();
