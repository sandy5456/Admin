import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kafe/BLOC/products_bloc.dart';
import 'package:kafe/MODELS/food_response.dart';
import 'package:kafe/PAGES/menu_page.dart';
import 'package:kafe/PAGES/offers_page.dart';
import 'package:kafe/PAGES/orders_page.dart';

class Tabbar extends StatefulWidget {
  int colorVal = 0xff84020e;
  @override
  _TabbarState createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
    _tabController.addListener(_handleTabSelection);
      propertyBloc.fetchAllCategory();
  }

  void _handleTabSelection() {
    setState(() {
      widget.colorVal = 0xff84020e;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: <Widget>[
                TabBar(
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.transparent,
                  unselectedLabelColor: Colors.grey,
                  tabs: <Widget>[
                    Tab(
                        icon: Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                  style: BorderStyle.solid))),
                      child: Center(
                        child: Text(
                          "MENU",
                          style: TextStyle(
                              color: _tabController.index == 0
                                  ? Colors.white
                                  : Colors.grey),
                          // child:Text('For You',style: TextStyle( color: _tabController.index == 0
                          //           ?  Color( widget.colorVal)
                          //           : Colors.grey)),
                        ),
                      ),
                    )),
                    Tab(
                        icon: Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                  style: BorderStyle.solid))),
                      child: Center(
                        child: Text(
                          "ORDERS",
                          style: TextStyle(
                              color: _tabController.index == 1
                                  ? Colors.white
                                  : Colors.grey),
                          // child:Text('For You',style: TextStyle( color: _tabController.index == 0
                          //           ?  Color( widget.colorVal)
                          //           : Colors.grey)),
                        ),
                      ),
                    )),
                    Tab(
                        icon: Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                  style: BorderStyle.solid))),
                      child: Center(
                        child: Text(
                          "OFFERS",
                          style: TextStyle(
                              color: _tabController.index == 2
                                  ? Colors.white
                                  : Colors.grey),
                          // child:Text('For You',style: TextStyle( color: _tabController.index == 0
                          //           ?  Color( widget.colorVal)
                          //           : Colors.grey)),
                        ),
                      ),
                    )),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      MenuScreen(),
                      // Container(
                      //   width: MediaQuery.of(context).size.width * 0.75,
                      //   height: MediaQuery.of(context).size.height,
                      //   child: StreamBuilder<List<FoodResponse>>(
                      //       stream: propertyBloc.allCategory,
                      //       builder: (context,
                      //           AsyncSnapshot<List<FoodResponse>> snapshot) {
                      //         return snapshot.hasData
                      //             ? Wrap(
                      //                 children: List.generate(
                      //                     snapshot.data.length, (index) {
                      //                 return MenuScreen(
                      //                   cId: snapshot.data[index].cId,
                      //                   name: snapshot.data[index].catogeryname,
                      //                   foods: snapshot.data[index].foods,
                      //                 );
                      //               }))
                      //             : Center(
                      //                 child: SpinKitWave(
                      //                 color: Colors.black45,
                      //                 size: 25.0,
                      //               ));
                      //       }),
                      // ),
                      OrderTab(),
                      OffersPage()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// Wrap(  children: List.generate(snapshot.data.length, (index){
//                       return MenuScreen(
//                         cId: snapshot.data[index].cId,
//                            name: snapshot.data[index].catogeryname,
//                           foods: snapshot.data[index].foods,
//                       );
//                     }));
