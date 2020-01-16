import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' show Client;
import 'package:kafe/BLOC/products_bloc.dart';
import 'package:kafe/BLOC/statmanagment.dart';


class EditItemApi {
  Client client = Client();

  Future editItemData(var cId,productId,name,price,offers,image) async {
   
    //print(stateManagmentData.image.path);
    var response = await Dio().post(
        "http://142.93.219.45:8080/KyanCafe/kyancafe/edit/$productId?categoryId.categoryId=$cId&productId=$productId&productName=$name&price=$price&offer=$offers&imageurl=$image",
        );
    if (response.statusCode == 200) {
       propertyBloc.fetchAllCategory();
      print(response.statusCode);
      return response;
    } else {
      throw (Exception("Failed"));
    }
  }
  
} //
//String message = data['message'];
