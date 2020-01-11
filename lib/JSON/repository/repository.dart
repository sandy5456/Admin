 import 'package:kafe/JSON/providers/product_api.dart';
import 'package:kafe/MODELS/food_response.dart';

class Repository{
    final propertyprovider = PropertyProvider();
      Future<List<FoodResponse>> fetchAllProperty() =>
      propertyprovider.fetchPropertyList();
 }