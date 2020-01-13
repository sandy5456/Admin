import 'dart:convert';

import 'package:http/http.dart';
import 'package:kafe/MODELS/order_response_model.dart';

class AllOrdersProvider {
  List<AllOrderResponse> list;

  Client client = Client();
  String allOrdersUrl = "http://142.93.219.45:8080/KyanCafe/foodie/orders";
  Future<List<AllOrderResponse>> fetchAllOrdersList() async {
    try {
      final response = await client.get(allOrdersUrl);

      print(response);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final rest = data as List;
        print("Al Orders data..");
        print(rest);

        list = rest
            .map<AllOrderResponse>((json) => AllOrderResponse.fromJson(json))
            .toList();

        return list;
      } else {
        throw Exception("Failed to load Deals");
      }
    } catch (e) {}
  }
} //http://142.93.219.45:8080/KyanCafe/kyancafe/showsMenu
