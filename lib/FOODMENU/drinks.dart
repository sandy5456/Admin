import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kafe/BLOC/products_bloc.dart';
import 'package:kafe/FOODMENU/hotdrinks.dart';
import 'package:kafe/MODELS/food_response.dart';
import 'package:kafe/PAGES/menu_page.dart';

class Soups extends StatefulWidget {
  var productId;
  @override
  _SoupsState createState() => _SoupsState();
}

class _SoupsState extends State<Soups> {
  void initState() {
    // TODO: implement initState
    super.initState();
    propertyBloc.fetchAllCategory();
  }

  List<bool> isFavorite;
  ScrollController _controller = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // height: MediaQuery.of(context).size.height * 0.01,
      // width: MediaQuery.of(context).size.width * 0.2,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: MediaQuery.of(context).size.height * 0.01,
            right: MediaQuery.of(context).size.width * 0.25,
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.03,
              child: Text("HOT DRINKS",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Abel',
                  )),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            child: Container(
              width: MediaQuery.of(context).size.width*0.75,
              height: MediaQuery.of(context).size.height,
              child: StreamBuilder<List<FoodResponse>>(
                  stream: propertyBloc.allCategory,
                  builder:
                      (context, AsyncSnapshot<List<FoodResponse>> snapshot) {
                    if (snapshot.hasData) {
                      if (isFavorite == null) {
                        isFavorite = List<bool>(snapshot.data.length);
                      }
                      //List<Aminety>aminities=snapshot.data[0].aminety;
                      // aMINITES=snapshot.data[10].aminety;
                      // iMAGES=snapshot.data[0].image;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SoupsItemCard(
                            cId: snapshot.data[index].cId,
                            name: snapshot.data[index].catogeryname,
                            foods: snapshot.data[index].foods,
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: SpinKitWave(
                          color: Colors.black45,
                          size: 25.0,
                        ),
                      );
                    }
                  }),
            ),
          ),
          //        Center(
          //          child: Container( color: Colors.white,
          //   height: MediaQuery.of(context).size.height * 0.03,
          //   child: Text("COLD DRINKS",style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'Abel',)),
          //   ),
          //        ),
          //        Container(
          //   color: Colors.white,
          //   height: MediaQuery.of(context).size.height * 0.25,
          //   child: StreamBuilder<List<FoodResponse>>(
          //       stream: propertyBloc.allCategory,
          //       builder: (context, AsyncSnapshot<List<FoodResponse>> snapshot) {
          //         if (snapshot.hasData) {
          //           //List<Aminety>aminities=snapshot.data[0].aminety;
          //           // aMINITES=snapshot.data[10].aminety;
          //           // iMAGES=snapshot.data[0].image;
          //           return ListView.builder(
          //             shrinkWrap: true,
          //             physics: ScrollPhysics(),
          //             scrollDirection: Axis.horizontal,
          //             itemCount: snapshot.data.length,
          //             itemBuilder: (BuildContext context, int index) {
          //               return ColdDrinksMenu(
          //                 cId: snapshot.data[index].cId,
          //                  name: snapshot.data[index].catogeryname,
          //                 foods: snapshot.data[index].foods,
          //               );
          //             },
          //           );
          //         } else {
          //           return Center(
          //             child: SpinKitWave(
          //               color: Colors.black45,
          //               size: 25.0,
          //             ),
          //           );
          //         }
          //       }),
          // ),
        ],
      ),
    );
  }

  //   addItemToCard() {
  //   bool isAddSuccess = Provider.of<MyCart>(context).addItem(CartItem(
  //     food:Food(), quantity: 1));

  //   if (isAddSuccess) {
  //     final snackBar = SnackBar(
  //       content:
  //       //Text("burger add to cart"),
  //        Text('${"widget.foods[index].name"} added to cart'),
  //       action: SnackBarAction(
  //         label: 'view',
  //         onPressed: showCart,
  //       ),
  //       duration: Duration(milliseconds: 1500),
  //     );
  //     Scaffold.of(context).showSnackBar(snackBar);
  //   } else {
  //     final snackBar = SnackBar(
  //       content: Text('You can\'t order from multiple shop at the same time'),
  //       duration: Duration(milliseconds: 1500),
  //     );
  //     Scaffold.of(context).showSnackBar(snackBar);
  //   }
  // }

}
