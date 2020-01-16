import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kafe/BLOC/all_orders_Bloc.dart';
import 'package:kafe/MODELS/order_response_model.dart';
import 'package:kafe/ORDERS/all_orders_list.dart';

class AllOrdersPage extends StatefulWidget {
  @override
  _AllOrdersPageState createState() => _AllOrdersPageState();
}

class _AllOrdersPageState extends State<AllOrdersPage> {
  void initState() {
    // TODO: implement initState
    super.initState();
    allOrdersBloc.fetchAllOrderResponce();
  }

  List<bool> isFavorite;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.70,
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
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                   
                    return AllOrdersList(
                       userId: snapshot.data[index].userId,
                      price: snapshot.data[index].price,
                      date: snapshot.data[index].date,
                      orderId: snapshot.data[index].orderId,
                                        orders: snapshot.data[index].orders,
                                      );
    
          });
    
           }
             else {
              return Center(
                child: SpinKitWave(
                  color: Colors.black45,
                  size: 25.0,
                ),
              );
            } }) );
  }
}
         