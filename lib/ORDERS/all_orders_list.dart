
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:kafe/BLOC/Today_order_bloc.dart';
import 'package:kafe/BLOC/all_orders_Bloc.dart';
import 'package:kafe/BLOC/conform-order_bloc.dart';
import 'package:kafe/MODELS/order_response_model.dart';
import 'package:toast/toast.dart';

class AllOrdersList extends StatefulWidget {
  final FoodStatus foodStatus;
  String userId;
  int orderId;
  double price;
  String date;
  List<Orders> orders;
  int tableNo;
  AllOrdersList(
      {this.orderId,
      this.price,
      this.orders,
      this.date,
      this.userId,
      this.foodStatus,
      this.tableNo});

  @override
  _AllOrdersListState createState() => _AllOrdersListState();
}

class _AllOrdersListState extends State<AllOrdersList> {
  List<bool> isFavorite;
  void initState() {
    // TODO: implement initState
    super.initState();
    allOrdersBloc.fetchAllOrderResponce();
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.35,
      child: StreamBuilder<List<AllOrderResponse>>(
          stream: allOrdersBloc.allOrders,
          builder: (context, AsyncSnapshot<List<AllOrderResponse>> snapshot) {
            if (snapshot.hasData) {
              if (isFavorite == null) {
                isFavorite = List<bool>(snapshot.data.length);
              }
           
              //List<Aminety>aminities=snapshot.data[0].aminety;
              // aMINITES=snapshot.data[10].aminety;
              // iMAGES=snapshot.data[0].image;
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                 
                  return Container(
                    //  color: Colors.red,
                    height: size.height * 0.35,
                    width: size.width,

                    padding: EdgeInsetsDirectional.only(
                        start: size.width * 0.01, end: size.width * 0.01),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45)),

                    child: Stack(
                      children: <Widget>[
                        widget.foodStatus.foodStatus == "CONFIRMED" ||
                                widget.foodStatus.foodStatus == "NEW ORDER"
                            ? Container(
                                color: Colors.red,
                                height: size.height * 0.05,
                              )
                            : widget.foodStatus.foodStatus == "BEING_PREPARED"
                                ? Container(
                                    color: Colors.orange,
                                    height: size.height * 0.05,
                                  )
                                : Container(
                                    color: Colors.green,
                                    height: size.height * 0.05,
                                  ),
                        Positioned(
                            top: size.height * 0.006,
                            left: size.width * 0.005,
                            child: Container(
                              //color: Colors.,
                              height: size.height * 0.038,
                              width: size.width * 0.10,
                              child: Text(
                                widget.date,
                                style: TextStyle(
                                    fontSize: 12.5,
                                    fontFamily: 'Abel',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45),
                              ),
                            )),
                        Positioned(
                            top: size.height * 0.005,
                            left: size.width * 0.3,
                            child: Container(
                              //color: Colors.red,
                              height: size.height * 0.042,
                              width: size.width * 0.14,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "ORDER  ${widget.orderId}",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Abel',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("T.No:${widget.tableNo}",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Abel',
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            )),
                        Positioned(
                            top: size.height * 0.005,
                            left: size.width * 0.54,
                            child: Container(
                              //color: Colors.red,
                              height: size.height * 0.018,
                              width: size.width * 0.18,
                              child: Text(
                                "p.no:${widget.userId}",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'Abel',
                                    fontWeight: FontWeight.normal),
                              ),
                            )),
                        Positioned(
                          top: size.height * 0.06,
                          child: Container(
                            width: size.width,
                            //color: Colors.,
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: 20),
                                Text(
                                  "ITEM NAME",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Abel',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45),
                                ),
                                SizedBox(width: size.width * 0.46),
                                Text(
                                  " QTY  ",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Abel',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45),
                                )
                              ],
                            ),
                          ),
                        ),

                        Positioned(
                            bottom: size.height * 0.040,
                            child: Container(
                              width: size.width,
                              height: size.height * 0.22,
                              color: Colors.white,
                              child: Wrap(
                                children: List.generate(widget.orders.length,
                                    (index) {
                                  return Container(
                                    height: size.height * 0.018,
                                    width: size.width * 0.61,
                                    color: Colors.white,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(width: 10),
                                        Text(
                                          "${widget.orders[index].itemName}",
                                          overflow: TextOverflow.visible,
                                          style: TextStyle(
                                              fontFamily: 'Abel',
                                              fontWeight: FontWeight.w600,
                                              fontSize: size.width * 0.022),
                                        ),
                                        Spacer(),
                                        Text(
                                          "${widget.orders[index].quantity}",
                                          textAlign: TextAlign.end,
                                          overflow: TextOverflow.visible,
                                          style: TextStyle(
                                              // color: Colors.black87,
                                              fontFamily: 'Abel',
                                              fontWeight: FontWeight.bold,
                                              fontSize: size.width * 0.024),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              ),
                            )),

                        Positioned(
                          bottom: size.height * 0.015,
                          left: size.width * 0.02,
                          child: Container(
                              child: RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'TOTAL',
                                    style: TextStyle(
                                        fontFamily: 'Abel',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10)),
                                TextSpan(
                                    text: " ${widget.price} QR",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'Abel')),
                              ],
                            ),
                          )),
                        ),
                        // Positioned(
                        //      top: size.height * 0.05,
                        //      left: size.width*0.65,
                        //   child: widget.foodStatus.foodStatus=="CONFIRMED"||widget.foodStatus.foodStatus=="NEW ORDER"?  Image.asset("images/dot.png",width: 40,color: Colors.red,):
                        //   widget.foodStatus.foodStatus=="BEING_PREPARED"? Image.asset("images/dot.png",width: 40,color: Colors.orange,):
                        //    Image.asset("images/dot.png",width: 40,color: Colors.green,)
                        // ),
                        Positioned(
                          bottom: size.height * 0.010,
                          left: size.width * 0.4,
                          child: ButtonTheme(
                              buttonColor: Colors.white54,
                              minWidth: 10.0,
                              height: 15.0,
                              child: InkWell(
                                onTap: () {
                                  isFavorite[index] = isFavorite[index] == null
                                      ? true
                                      : !isFavorite[index];
                                  if (isFavorite[index] == true &&
                                      widget.foodStatus.foodStatus ==
                                          "NEW ORDER") {
                                    print(widget.foodStatus.foodStatus);
                                    Toast.show("order confirmed", context,
                                        duration: 2,
                                        gravity: Toast.CENTER,
                                        backgroundColor: Colors.black);
                                    //isFavorite[index] = !isFavorite[index];
                                    confirmOrder(widget.orderId);
                                  } else {
                                    Toast.show("already confirmed", context,
                                        duration: 2,
                                        gravity: Toast.CENTER,
                                        backgroundColor: Colors.black);
                                  }
                                  setState(() {});
                                },
                                child: isFavorite[index] == null &&
                                        widget.foodStatus.foodStatus ==
                                            "NEW ORDER"
                                    ? Container(
                                        // color: Colors.green,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.30,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                        decoration: new BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: new BorderRadius.only(
                                                topLeft:
                                                    const Radius.circular(20.0),
                                                bottomLeft:
                                                    const Radius.circular(
                                                        20.0))),
                                        child: Center(
                                            child: Text(
                                          "NEW ORDER",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Abel'),
                                        )),
                                      )
                                    : isFavorite[index] == false
                                        ? Container(
                                            // color: Colors.green,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.30,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03,
                                            decoration: new BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: new BorderRadius
                                                        .only(
                                                    topLeft:
                                                        const Radius.circular(
                                                            20.0),
                                                    bottomLeft:
                                                        const Radius.circular(
                                                            20.0))),
                                            child: Center(
                                                child: Text(
                                              "",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Abel'),
                                            )),
                                          )
                                        : Container(
                                            // color: Colors.green,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.30,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03,
                                            decoration: new BoxDecoration(
                                                color: Colors.green,
                                                borderRadius: new BorderRadius
                                                        .only(
                                                    topLeft:
                                                        const Radius.circular(
                                                            20.0),
                                                    bottomLeft:
                                                        const Radius.circular(
                                                            20.0))),
                                            child: Center(
                                                child: Text(
                                              "CONFIRMED",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Abel'),
                                            )),
                                          ),
                              )),
                        ),
                      ],
                    ),
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
    );
  }

  confirmOrder(var orderId) async {
    await confirmOrderBLoc.conformOrder(orderId);
  }
}
