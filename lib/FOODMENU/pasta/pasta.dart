import 'package:flutter/material.dart';
import 'package:kafe/BLOC/remove_item_bloc.dart';
import 'package:kafe/BLOC/statmanagment.dart';


import 'package:flutter/foundation.dart';
import 'package:kafe/MODELS/food_response.dart';
import 'package:kafe/WIDGETS/aleartBox.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Pasta extends StatefulWidget {
  List<Food> foods;
  int cId;
  String name;

  Pasta({this.foods, this.name, this.cId});
  @override
  _PastaState createState() => _PastaState();
}

class _PastaState extends State<Pasta> {
  String phoneNumber;
  final _key = new GlobalKey<FormState>();
  Future<Null> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    phoneNumber = prefs.getString("phone");
  }

   final nameController = TextEditingController();
    final phoneNumberController = TextEditingController();
    final passwordController = TextEditingController();
    String name, email, mobile, password;
  bool liked = false;
  List<bool> isFavorite;
  void initState() {
    // TODO: implement initState
    super.initState();
    getSharedPrefs();
  }

// presserd(){
//   setState(() {
//     liked=!liked;
//     print(liked);

//   });
// }

  @override
   Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Wrap(
                          children: List.generate(widget.foods.length, (index) {
                              return widget.name=="pasta"? Container(
                            //color: Colors.yellow,
                            
  
                width: size.width,
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.07,
                child:
                    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    InkWell(
                        onTap: () async => {
                              alertBox(
                                  context,
                                  index,
                                  widget.cId,
                                  widget.foods[index].id,
                                  widget.foods[index].images)
                            },
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                elevation: 1,
                                margin: EdgeInsets.only(
                                    left: 10, right: 10, top: 5),
                                child: Container(
                                  height: size.height * 0.10,
                                  width: size.width * 1,
                                  padding: EdgeInsetsDirectional.only(
                                      start: size.width * 0.01,
                                      end: size.width * 0.01),
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned(
                                        top: size.height * 0.015,
                                        right: size.width * 0.22,
                                        child: Container(
                                          width: size.width * 0.3,
                                          color: Colors.white,
                                          child: Text(
                                            "${widget.foods[index].name}",
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.visible,
                                            style: TextStyle(
                                                fontFamily: 'Abel',
                                                fontWeight: FontWeight.bold,
                                                fontSize: size.width * 0.025),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: size.height * 0.012,
                                        right: size.width * 0.1,
                                        child: Container(
                                            child: RichText(
                                          text: TextSpan(
                                            style: DefaultTextStyle.of(context)
                                                .style,
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text:
                                                      "${widget.foods[index].price}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black,
                                                      fontSize: 10)),
                                              TextSpan(
                                                  text: 'QR',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 10)),
                                            ],
                                          ),
                                        )),
                                      ),
                                      Positioned(
                                        top: size.height * 0.003,
                                        right: size.width * 0.00,
                                        child: GestureDetector(
                                          onTap: () {
                                            remove(widget.foods[index].id);
                                            SnackBar bar = SnackBar(
                                              content: Text(
                                                  "${widget.foods[index].name} removed successfully"),
                                              duration: Duration(seconds: 1),
                                            );
                                            Scaffold.of(context)
                                                .showSnackBar(bar);
                                          },
                                          child: Container(
                                            color: Color(0xff8c0001),
                                            child: Center(
                                              child: Text(
                                                "Remove",
                                                style: TextStyle(
                                                    fontFamily: 'Abel',
                                                    color: Colors.white,
                                                    fontSize: 10),
                                              ),
                                            ),
                                            height: size.height * 0.04,
                                            width: size.width * 0.10,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: size.width * 0.01,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fitHeight,
                                      image: NetworkImage(
                                          "http://142.93.219.45/upload/" +
                                              widget.foods[index].images)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                ),
                                padding: EdgeInsetsDirectional.only(
                                    start: size.width * 0.05),
                                height: size.height * 0.07,
                                width: size.width * 0.15,
                              ),
                            ),
                          ],
                        )))
            : Container(
                color: Colors.white,
                width: 0.1,
              );
      }),
    );
  }

  remove(var productId) async {
    await removeItemBloc.removeitem(productId);
  }
}
