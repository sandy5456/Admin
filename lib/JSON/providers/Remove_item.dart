import 'dart:async';
import 'package:dio/dio.dart';

import 'package:http/http.dart' show Client;
import 'package:kafe/BLOC/products_bloc.dart';


class RemoveApi {
  Client client = Client();



  Future removeItem(productId) async {
    var response = await Dio().post(
      "http://142.93.219.45:8080/KyanCafe/kyancafe/product/Delete/$productId"
      //  "http://142.93.219.45:8080/KyanCafe/kyancafe/favourites/$productId/user/$phone",
    );
    if (response.statusCode == 200) {
       propertyBloc.fetchAllCategory();
      print(response.statusCode);
      return response;
    } else {
      throw (Exception("Failed"));
    }
  }
}
