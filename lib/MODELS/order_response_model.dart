class AllOrderResponse {
  final double price;
  final int orderId;
  List<Orders>orders;
  final String date;
  final int cId;
  final String userId;

  AllOrderResponse({
    this.price,
    this.orderId,
    this.orders,
    this.cId,
    this.date,
    this.userId
  });

  factory AllOrderResponse.fromJson(Map<String, dynamic> json) {

    return AllOrderResponse(
     orders: (json['ohi'] as List)
          .map((i) => Orders.fromJson(i))
          .toList(),
          price: json['price'],
      orderId: json['orderId'],
     // cId: json['categoryId'],
      date: json['date'],
      userId: json['userId'],
    );
  }
}
//FoodResponse Food
class Orders{
  final String itemName;
  final int quantity;


  Orders({
   this.itemName,
   this.quantity
  });
  factory Orders.fromJson(Map<String, dynamic> json){
    return Orders(
      quantity: json['quantity'],
      itemName: json['name'],


      );
}
}