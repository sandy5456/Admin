import 'package:flutter/material.dart';
import 'package:kafe/BLOC/statmanagment.dart';

import 'package:kafe/ORDERS/All_order.dart';
import 'package:kafe/ORDERS/Today_order.dart';
import 'package:kafe/ORDERS/all_orders_list.dart';
import 'package:kafe/ORDERS/yesderday_orders.dart';

import 'package:vertical_tabs/vertical_tabs.dart';

class OrderTab extends StatefulWidget {

  @override
  _OrderTabState createState() => _OrderTabState();
}

class _OrderTabState extends State<OrderTab> {

  @override
  Widget build(BuildContext context) {
    return 
       Container(
         color: Colors.white,
         
         child: Stack(
           
          children: <Widget>[
            
             Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child:  VerticalTabs(
                    indicatorColor: Colors.white,
                    unselectedTabBackgroundColor: Color(0xffcdcdcd),
                    selectedTabBackgroundColor: Colors.white,
                    contentScrollAxis: Axis.vertical,
                    indicatorWidth: 2,
                    itemExtent: 30,
                    tabsWidth: 100,
                    tabs: <Tab>[
                      Tab(
                        child: box("TODAY"),//=${stateManagmentData.todayOrderCount}
                      ),
                      Tab(child: box("YESTERDAY")),
                      Tab(child: box("ALL")),
    

                    ],
                    contents: <Widget>[
                    //    SoupsItemCard(
                    //   cId: widget.cId,
                    //   name: widget.name,
                    //   foods: widget.foods,
                    // ),
                     TodayOrdersPage(),
                     YesterdayOrdersPage(),
                   
                   AllOrdersPage(),

                    ],
                  ),
                
              ),
            
            // Positioned(
            //   left: MediaQuery.of(context).size.width * 0.03,
            //   bottom: MediaQuery.of(context).size.height * 0.05,
            //   child: Container(
            //     height: MediaQuery.of(context).size.height * 0.04,
            //     width: MediaQuery.of(context).size.width * 0.2,
            //     child: FlatButton(
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(0.0)),
            //       child: Text('ADD',
            //           style: TextStyle(
            //               fontSize: 12,
            //               fontWeight: FontWeight.bold,
            //               color: Colors.white,
            //               fontFamily: 'Abel')),
            //       onPressed: () {
            //         setState(() {
            //            Navigator.push(
            //                           context,
            //                           MaterialPageRoute(
            //                               builder: (context) => AddItem()),
            //                         );
            //         });
            //       },
            //       color: Colors.black87,
            //     ),
            //   ),
            // ),
          ],
      ),
       );
    
  }

  Widget box(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            child: Center(
          child: Text(text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Abel',
                  fontSize: 11)),
        )),
        Divider(
          color: Colors.transparent,
          height: 1,
        ),
        Container(
          // padding: EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(
              //                    <--- top side
              color: Colors.white,
              width: 0.3,
            ),
          )),
        ),
      ],
    );
  }
}
