class FoodResponse {
  final String catogeryname;
  List<Food>foods;
  final int cId;

  FoodResponse({
    this.catogeryname,
    this.foods,
    this.cId
  });

  factory FoodResponse.fromJson(Map<String, dynamic> json) {

    return FoodResponse(
     foods: (json['products'] as List)
          .map((i) => Food.fromJson(i))
          .toList(),
      catogeryname: json['categoryName'],
      cId: json['categoryId'],
    );
  }
}
//FoodResponse Food
class Food{
  int offers;
String images;
int catogeryid;
  int id;
  String name;
  String description;
  double price;
  int rating;
  Shop shop;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  int favid;

  Food({
    this.catogeryid,
 this.images,
    this.id,
    this.name,
    this.description,
    this.price,
    this.rating,
    this.shop,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.favid,
    this.offers,
  });
  factory Food.fromJson(Map<String, dynamic> json){
    return Food(
      id: json['productId'],
      name: json['productName'],
      images: json['imageurl'],
      price: json['price'],
      catogeryid: json['categoryId'],
      favid:json['id'],
      offers: json['offer']

      );
}
}

class Shop {
  String id;
  String name;
  String email;

  Shop({this.id, this.name, this.email});

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
      );
}

enum FoodTypes {
  
  StreetFood,
  All,
  Coffee,
  Asian,
  Burger,
  Dessert,
}

  