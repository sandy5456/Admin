import 'package:flutter/material.dart';
import 'package:kafe/BLOC/statmanagment.dart';


import 'package:flutter/foundation.dart';
import 'package:kafe/MODELS/food_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Salad extends StatefulWidget {
  List<Food> foods;
  int cId;
  String name;

  Salad({this.foods, this.name, this.cId});
  @override
  _SaladState createState() => _SaladState();
}

class _SaladState extends State<Salad> {
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
                              return widget.name=="salad"? Container(
                            //color: Colors.yellow,
                            
                            width: size.width,
                            color: Colors.white,
                            height: MediaQuery.of(context).size.height *0.07,
                            child: 
                                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                InkWell(
                                    onTap: () async =>
                                        {alertBox(context, index, phoneNumber)},
                                    child: Stack(
                                          children: <Widget>[
                                            Container(
                                              width:
                                                  MediaQuery.of(context).size.width ,
                                              height:
                                                  MediaQuery.of(context).size.height * 0.05,
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
                                                                fontSize:
                                                                    size.width * 0.025),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: size.height * 0.012,
                                                        right: size.width * 0.1,
                                                        child: Container(
                                                            child: RichText(
                                                          text: TextSpan(
                                                            style:
                                                                DefaultTextStyle.of(context)
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
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(8.0)),
                                                ),
                                                padding: EdgeInsetsDirectional.only(
                                                    start: size.width * 0.05),
                                                height: size.height * 0.07,
                                                width: size.width * 0.15,
                                              ),
                                            ),
                                          ],
                                        ))
                            
                      ):Container(
                        color: Colors.white,
                        width: 0.1,
                      );
        }
      ),
    );
    
}

  alertBox(BuildContext context, int index, var phone) {
 

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(40.0)), //this right here
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.50,
                  //width: MediaQuery.of(context).size.width * 0.60,
                  child: ListView(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0.0)),
                              image: new DecorationImage(
                                image: new NetworkImage(
                                    "http://142.93.219.45/upload/" +
                                        widget.foods[index].images), //Image
                                fit: BoxFit.cover,
                              ),
                            ),
                            width: MediaQuery.of(context).size.width * 0.93,
                            height: MediaQuery.of(context).size.height * 0.3,
                          ),
                          Positioned(
                              right: 0.0,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: CircleAvatar(
                                    radius: 14.0,
                                    backgroundColor: Colors.transparent,
                                    child: Icon(Icons.close,
                                        color: Colors.white54),
                                  ),
                                ),
                              ))
                        ],
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 2, right: 2, top: 2),
                            color: Colors.white12,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.06,
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.bottom,
                              controller: nameController,
                              cursorColor: Colors.black,
                              validator: (e) {
                                if (e.isEmpty) {
                                  return "Please item Name";
                                }
                              },
                              onSaved: (e) => name = e,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                              decoration: InputDecoration(
                                  hintStyle: TextStyle(color: Colors.black54),
                                  fillColor: Colors.black,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 0.8),
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(0.0)),
                                      borderSide: BorderSide(
                                        color: Colors.black12,
                                      )),
                                  hintText: "New Name"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.10,
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.14,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 2, right: 2),
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 0.20,
                            color: Colors.white12,
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.bottom,
                              cursorColor: Colors.black,
                              controller: phoneNumberController,
                              validator: (e) {
                                if (e.isEmpty) {
                                  return "Please enter price";
                                }
                              },
                              onSaved: (e) => mobile = e,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                              decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.black54),
                                fillColor: Colors.black,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 0.7),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(0.0)),
                                    borderSide: BorderSide(
                                      color: Colors.black12,
                                    )),
                                hintText: "Price Qr",
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.10,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 0.20,
                            child: TextFormField(
                                textAlignVertical: TextAlignVertical.bottom,
                                textAlign: TextAlign.start,
                                cursorColor: Colors.black,
                                controller: passwordController,
                                //obscureText: _secureText,
                                onSaved: (e) => password = e,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                                decoration: InputDecoration(
                                  //     suffixIcon: IconButton(
                                  //       onPressed: showHide,
                                  //       icon: Icon(_secureText
                                  //           ? Icons.visibility_off
                                  //           : Icons.visibility,color: Colors.white38,),
                                  //     ),
                                  //  prefixIcon: Padding(
                                  //     padding: EdgeInsets.only(left: 20, right: 15),
                                  //     child: Icon(Icons.phonelink_lock, color: Colors.white24),
                                  //   ),
                                  hintStyle: TextStyle(color: Colors.black54),
                                  fillColor: Colors.black,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 0.7),
                                    borderRadius: BorderRadius.circular(1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(1.0)),
                                      borderSide: BorderSide(
                                        color: Colors.black12,
                                      )),
                                  hintText: " Offer %",
                                ),
                                keyboardType: TextInputType.number),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.0130,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0585,
                          width: double.infinity, // match_parent
                          child: FlatButton(
                            color: Colors.black,
                            textColor: Colors.white,
                            onPressed: () {
                              setState(() {
                                check();
                                // addingtoCart("${widget.foods[index].id}",
                                //     "${stateManagmentData.quantity}");
                                //      getCartBloc.fetchAllGetCartItem();

                                // print(widget.foods[index].id);
                                // print(stateManagmentData.quantity);
                                // Toast.show("added to cart", context,
                                //     duration: Toast.LENGTH_SHORT,
                                //     gravity: Toast.LENGTH_SHORT);
                                // Navigator.of(context).pop();
                              });
                            },
                            child: Text(
                              "SUBMIT",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ))
                    ],
                  ),
                ));
          });
        });
  }
  check() {
   // final form = _key.currentState;
    if (nameController.text!=""&&phoneNumberController.text!="") {
      // form.save();
      // save();
      //register(nameController.text,phoneNumberController.text,passwordController.text,stateManagmentData.image);
      print(nameController.text);
      // print(stateManagmentData.image);
    } else {
      return Fluttertoast.showToast(
          msg: "Enter name & Price ",
         toastLength:Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white);
    }
  }
}
