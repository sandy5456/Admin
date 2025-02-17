


import 'package:kafe/JSON/repository/repository.dart';
import 'package:kafe/MODELS/food_response.dart';
import 'package:rxdart/rxdart.dart';

class PropertyBloc {
  final _repository = Repository();
  final _dealFetcher = PublishSubject<List<FoodResponse>>();

  Observable<List<FoodResponse>> get allCategory => _dealFetcher.stream;

  fetchAllCategory() async {
    List<FoodResponse> categoryModel = await _repository.fetchAllProperty();
    _dealFetcher.sink.add(categoryModel);
  }

  dispose() async {
    await _dealFetcher.drain();
    _dealFetcher.close();
  }
}

final propertyBloc = PropertyBloc();