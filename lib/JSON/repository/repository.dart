

import 'package:kafe/JSON/providers/add_item_api.dart';
import 'package:kafe/JSON/providers/all_orders_api.dart';
import 'package:kafe/JSON/providers/product_api.dart';
import 'package:kafe/MODELS/food_response.dart';
import 'package:kafe/MODELS/order_response_model.dart';

class Repository{
  final additemApi=AddItemApi();
    final propertyprovider = PropertyProvider();
    final allordersProviders=AllOrdersProvider();

    
  Future<List<AllOrderResponse>> fetchAllOrders() =>
      allordersProviders.fetchAllOrdersList();
      Future<List<FoodResponse>> fetchAllProperty() =>
      propertyprovider.fetchPropertyList();
       Future additemPost(var id,name, price, offer, image)=>
  additemApi.postRegistrationData(id,name, price, offer, image);
 }