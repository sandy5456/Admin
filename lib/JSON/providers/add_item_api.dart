import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' show Client;
import 'package:kafe/BLOC/statmanagment.dart';


class AddItemApi {
  Client client = Client();

  Future postRegistrationData(id,name, price, offer, image) async {
      //  double cost=double.parse(price);
      //  int discount=int.parse(offer);
       
    List<int> imageByte = image.readAsBytesSync();
    FormData formData = FormData.fromMap({
      "mf": await MultipartFile.fromBytes(
        imageByte,
        filename: stateManagmentData.image.path.split("/").last,
      )
    });
    print(stateManagmentData.image.path);
    var response = await Dio().post(
        "http://142.93.219.45:8080/KyanCafe/kyancafe/addMenuItem?categoryId.categoryId=$id&productName=$name&price=$price&offer=$offer",
        data: formData);
    if (response.statusCode == 200) {
      print(response.statusCode);
      return response;
    } else {
      throw (Exception("Failed"));
    }
  }
  
} //
//String message = data['message'];
