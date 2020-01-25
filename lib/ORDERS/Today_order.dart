import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kafe/BLOC/Today_order_bloc.dart';
import 'package:kafe/BLOC/all_orders_Bloc.dart';
import 'package:kafe/BLOC/statmanagment.dart';
import 'package:kafe/MODELS/order_response_model.dart';
import 'package:kafe/ORDERS/all_orders_list.dart';

class TodayOrdersPage extends StatefulWidget {
  @override
  _TodayOrdersPageState createState() => _TodayOrdersPageState();
}

class _TodayOrdersPageState extends State<TodayOrdersPage> {
   Timer timer;
  void initState() {
    // TODO: implement initState
    super.initState();
    todayOrdersBloc.fetchTodayOrderResponce();
     timer = Timer.periodic(Duration(seconds: 5), (Timer t) => todayOrdersBloc.fetchTodayOrderResponce());
  }

  List<bool> isFavorite;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.70,
      child: StreamBuilder<List<AllOrderResponse>>(
          stream: todayOrdersBloc.todayOrders,
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
                  //  stateManagmentData.settodayOrderCounr(snapshot.data.length);
                    //print(stateManagmentData.todayOrderCount);
                if (snapshot.data[index].foodStatus.foodStatus ==
                          "NEW ORDER") {
                        FlutterRingtonePlayer.play(
                          android: AndroidSounds.notification,
                          ios: IosSounds.glass,
                          looping: false, // Android only - API >= 28
                          volume: 1000.0, // Android only - API >= 28
                          asAlarm: false, // Android only - all APIs
                        );
                      }
                    return AllOrdersList(
                         tableNo: snapshot.data[index].tableNo,
                              foodStatus: snapshot.data[index].foodStatus,
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
         