

import 'package:kafe/JSON/repository/repository.dart';
import 'package:kafe/MODELS/order_response_model.dart';
import 'package:rxdart/rxdart.dart';

class YesterdayOrdersBloc {
  final _repository = Repository();
  final _dealFetcher = PublishSubject<List<AllOrderResponse>>();

  Observable<List<AllOrderResponse>> get yesterdayOrders => _dealFetcher.stream;

  
 fetchyesterdayOrderResponce() async {
    List<AllOrderResponse> categoryModel = await _repository.fetchyesterdayOrders();
    _dealFetcher.sink.add(categoryModel);
  }
   
  dispose() async {
    await _dealFetcher.drain();
    _dealFetcher.close();
  }
}

final yesterdayOrdersBloc = YesterdayOrdersBloc();