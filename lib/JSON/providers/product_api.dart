import 'dart:convert';


import 'package:http/http.dart';
import 'package:kafe/MODELS/food_response.dart';



class PropertyProvider {
  List<FoodResponse> list;

  Client client = Client();
  String propertyUrl = "http://142.93.219.45:8080/KyanCafe/kyancafe/showsMenu";
  Future<List<FoodResponse>> fetchPropertyList() async {
    try {
      final response = await client.get(propertyUrl);
     
      print(response);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final rest = data as List;
        print("we r getting data..");
        print(rest);

        list = rest
            .map<FoodResponse>((json) => FoodResponse.fromJson(json))
            .toList();

        return list;
      } else {
        throw Exception("Failed to load Deals");
      }
    } catch (e) {}
  }
}//http://142.93.219.45:8080/KyanCafe/kyancafe/showsMenu