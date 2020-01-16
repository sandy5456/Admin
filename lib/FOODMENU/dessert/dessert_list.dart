

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kafe/BLOC/products_bloc.dart';
import 'package:kafe/FOODMENU/cold_drinks.dart';
import 'package:kafe/FOODMENU/dessert/dessret.dart';
import 'package:kafe/FOODMENU/hotdrinks.dart';
import 'package:kafe/FOODMENU/maincourse/main_course.dart';
import 'package:kafe/FOODMENU/pasta/pasta.dart';
import 'package:kafe/FOODMENU/salad/salad.dart';
import 'package:kafe/MODELS/food_response.dart';


class DessertList extends StatefulWidget {
    List<Food> foods;
  int cId;
  String name;
  var productId;
  DessertList({
    this.foods, this.name, this.cId
  });
  @override
  _DessertListState createState() => _DessertListState();
}

class _DessertListState extends State<DessertList> {
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
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        controller: _controller,
        children: <Widget>[
          Center(
            child: Container( color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.03,
              child: Text("DESSERT",style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'Abel',)),
              ),
          ),
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 1,
            child: StreamBuilder<List<FoodResponse>>(
                stream: propertyBloc.allCategory,
                builder: (context, AsyncSnapshot<List<FoodResponse>> snapshot) {
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
                        return Desert(
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
