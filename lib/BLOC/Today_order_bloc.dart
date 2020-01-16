

import 'package:kafe/JSON/repository/repository.dart';
import 'package:kafe/MODELS/order_response_model.dart';
import 'package:rxdart/rxdart.dart';

class TodayOrdersBloc {
  final _repository = Repository();
  final _dealFetcher = PublishSubject<List<AllOrderResponse>>();

  Observable<List<AllOrderResponse>> get todayOrders => _dealFetcher.stream;

  
 fetchTodayOrderResponce() async {
    List<AllOrderResponse> categoryModel = await _repository.fetchTodayOrders();
    _dealFetcher.sink.add(categoryModel);
  }
   
  dispose() async {
    await _dealFetcher.drain();
    _dealFetcher.close();
  }
}

final todayOrdersBloc = TodayOrdersBloc();