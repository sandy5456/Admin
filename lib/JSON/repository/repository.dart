

import 'package:kafe/JSON/providers/add_item_api.dart';
import 'package:kafe/JSON/providers/product_api.dart';
import 'package:kafe/MODELS/food_response.dart';

class Repository{
  final additemApi=AddItemApi();
    final propertyprovider = PropertyProvider();
      Future<List<FoodResponse>> fetchAllProperty() =>
      propertyprovider.fetchPropertyList();
       Future additemPost(var id,name, price, offer, image)=>
  additemApi.postRegistrationData(id,name, price, offer, image);
 }