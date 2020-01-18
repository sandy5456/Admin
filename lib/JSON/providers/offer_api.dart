import 'dart:convert';


import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:kafe/BLOC/offers_bloc.dart';
import 'package:kafe/MODELS/offer_model.dart';

import 'package:shared_preferences/shared_preferences.dart';


class OfferApi {
  
  List<GetOfferModel> list;

  Client client = Client();
  String favUrl = "http://142.93.219.45:8080/KyanCafe/kyancafe/showOffers";
  Future<List<GetOfferModel>> fetchoffersList() async {
    try {
      final response = await client.get(favUrl);
     
      print(response);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final rest = data as List;
        print("offers data..");
        print(rest);

        list = rest
            .map<GetOfferModel>((json) => GetOfferModel.fromJson(json))
            .toList();

        return list;
      } else {
        throw Exception("Failed to load Deals");
      }
    } catch (e) {}
  }
}


class RemoveOfferApi {
  Client client = Client();



  Future removeOffer(productId,offer) async {
    var response = await Dio().post(
      "http://142.93.219.45:8080/KyanCafe/kyancafe/addOffers/$productId?offer=$offer"
      //  "http://142.93.219.45:8080/KyanCafe/kyancafe/favourites/$productId/user/$phone",
    );
    if (response.statusCode == 200) {
      // propertyBloc.fetchAllCategory();
        offersBloc.fetchOffersList();
      print(response.statusCode);
      return response;
    } else {
      throw (Exception("Failed"));
    }
  }
}
