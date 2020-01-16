class GetOfferModel {
  final String productname;
  final int pId;
  String image;
  double price;
  int offers;

  GetOfferModel({this.productname, this.offers, this.image, this.price, this.pId});

  factory GetOfferModel.fromJson(Map<String, dynamic> json) {
    return GetOfferModel(
      productname: json['productName'],
      pId: json['productId'],
      price: json['price'],
      image: json['imageurl'],
      offers: json['offer'],
    );
  }
}
