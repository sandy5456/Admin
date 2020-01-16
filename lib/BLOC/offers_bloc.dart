

import 'package:kafe/JSON/repository/repository.dart';
import 'package:kafe/MODELS/offer_model.dart';
import 'package:rxdart/rxdart.dart';

class OffersBloc {
  final _repository = Repository();
  final _favListFetcher = PublishSubject<List<GetOfferModel>>();

  Observable<List<GetOfferModel>> get alloffers => _favListFetcher.stream;

  fetchOffersList() async {
    List<GetOfferModel> categoryModel = await _repository.fetchOffersList();
    _favListFetcher.sink.add(categoryModel);
  }

  dispose() async {
    await _favListFetcher.drain();
    _favListFetcher.close();
  }
}

final offersBloc = OffersBloc();