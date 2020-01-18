

import 'package:kafe/JSON/providers/Remove_item.dart';
import 'package:kafe/JSON/providers/add_item_api.dart';
import 'package:kafe/JSON/providers/all_orders_api.dart';
import 'package:kafe/JSON/providers/edit_item.dart';
import 'package:kafe/JSON/providers/offer_api.dart';
import 'package:kafe/JSON/providers/product_api.dart';

import 'package:kafe/MODELS/food_response.dart';
import 'package:kafe/MODELS/offer_model.dart';
import 'package:kafe/MODELS/order_response_model.dart';

class Repository{
  final additemApi=AddItemApi();
    final propertyprovider = PropertyProvider();
    final allordersProviders=AllOrdersProvider();
    final todayOrdersProvider=TodayOrdersProvider();
    final yesterdayOrdersProvider=YesterdayOrdersProvider();
    final editItemApi=EditItemApi();
    final offerApi=OfferApi();
    final removeApi=RemoveApi();
    final removeOfferApi=RemoveOfferApi();

 Future<List<GetOfferModel>> fetchOffersList() => offerApi.fetchoffersList();
      Future<List<AllOrderResponse>> fetchyesterdayOrders() =>
      yesterdayOrdersProvider.fetchYesterdayOrdersList();  
  
  Future<List<AllOrderResponse>> fetchTodayOrders() =>
      todayOrdersProvider.fetchTodayOrdersList();  
  Future<List<AllOrderResponse>> fetchAllOrders() =>
      allordersProviders.fetchAllOrdersList();
      Future<List<FoodResponse>> fetchAllProperty() =>
      propertyprovider.fetchPropertyList();
       Future additemPost(var id,name, price, offer, image)=>
  additemApi.postRegistrationData(id,name, price, offer, image);
         Future editItemPost(var cId,productId,name,price,offers,image)=>
  editItemApi.editItemData(cId,productId,name,price,offers,image);
   Future removeProduct(var productId ) =>
      removeApi.removeItem(productId);
         Future removeOffer(var productId,offer ) =>
      removeOfferApi.removeOffer(productId,offer);
 }