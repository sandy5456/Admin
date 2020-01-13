import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kafe/BLOC/all_orders_Bloc.dart';
import 'package:kafe/MODELS/order_response_model.dart';

class AllOrdersList extends StatefulWidget {
  int orderId;
  double price;
  String date;
  List<Orders> orders;
  AllOrdersList({this.orderId, this.price, this.orders, this.date});

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
      height: MediaQuery.of(context).size.height * 0.22,
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
                    // color: Colors.red,
                    height: size.height * 0.20,
                    width: size.width,

                    padding: EdgeInsetsDirectional.only(
                        start: size.width * 0.01, end: size.width * 0.01),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12)),

                    child: Stack(
                      children: <Widget>[
                        Container(
                          color: Colors.grey[400],
                          height: size.height * 0.05,
                        ),
                        Positioned(
                            top: size.height * 0.006,
                            left: size.width * 0.005,
                            child: Container(
                              //color: Colors.,
                              height: size.height * 0.040,
                              width: size.width * 0.12,
                              child: Text(
                                widget.date,
                                style: TextStyle(
                                    fontSize: 9,
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
                              height: size.height * 0.040,
                              width: size.width * 0.14,
                              child: Text(
                                "ORDER  ${widget.orderId}",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Abel',
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                        Positioned(
                          top: size.height * 0.06,
                          child: Container(
                            width: size.width,
                            //color: Colors.,
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: 15),
                                Text(
                                  " ITEM = ${widget.orders.length}",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'Abel',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45),
                                ),
                                SizedBox(width: size.width * 0.42),
                                Text(
                                  " QTY  ",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'Abel',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45),
                                )
                              ],
                            ),
                          ),
                        ),

                        Positioned(
                            bottom: size.height * 0.06,
                            child: Container(
                              width: size.width,
                              height: size.height * 0.07,
                              color: Colors.white,
                              child: ListView(
                                children: <Widget>[
                                  Wrap(
                                    children: List.generate(
                                        widget.orders.length, (index) {
                                      return Container(
                                        width: size.width * 0.6,
                                        color: Colors.white,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(width:10),
                                            Text(
                                              "${widget.orders[index].itemName}",
                                              overflow: TextOverflow.visible,
                                              style: TextStyle(
                                                  fontFamily: 'Abel',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: size.width * 0.028),
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
                                                  fontSize: size.width * 0.030),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            )
                           
                            ),

                        Positioned(
                          bottom: size.height * 0.025,
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
                                        fontSize: 12,
                                        fontFamily: 'Abel')),
                              ],
                            ),
                          )),
                        ),
                      
                        Positioned(
                          bottom: size.height * 0.016,
                          left: size.width * 0.4,
                          child: ButtonTheme(
                              buttonColor: Colors.white,
                              minWidth: 10.0,
                              height: 20.0,
                              child: InkWell(
                                onTap: () {
                                  isFavorite[index] = isFavorite[index] == null
                                      ? true
                                      : !isFavorite[index];
                                  setState(() {});
                                },
                                child: isFavorite[index] == null
                                    ? Container(
                                        // color: Colors.green,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.30,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
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
                                          "CONFIRM",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Abel'),
                                        )),
                                      )
                                    : isFavorite[index]==false
                                        ? Container(
                                            // color: Colors.green,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.30,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.04,
                                            decoration: new BoxDecoration(
                                                color: Colors.red,
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
                                              "CONFIRM",
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
                                                0.04,
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
}
