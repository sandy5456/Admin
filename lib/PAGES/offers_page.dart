import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kafe/BLOC/offers_bloc.dart';
import 'package:kafe/BLOC/remove_item_bloc.dart';
import 'package:kafe/MODELS/offer_model.dart';
class OffersPage extends StatefulWidget {
  @override
  _OffersPageState createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
   final nameController = TextEditingController();
    final phoneNumberController = TextEditingController();
    final passwordController = TextEditingController();
       String name, email, mobile, password;
    void initState() {
    // TODO: implement initState
    super.initState();
    offersBloc.fetchOffersList();
  }
    int discount;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      height: size.height,
      child: StreamBuilder<List<GetOfferModel>>(
                    stream: offersBloc.alloffers,
                    builder:
                        (context, AsyncSnapshot<List<GetOfferModel>> snapshot) {
                      if (snapshot.hasData) {
                       

                        //List<Aminety>aminities=snapshot.data[0].aminety;
                        // aMINITES=snapshot.data[10].aminety;
                        // iMAGES=snapshot.data[0].image;
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return  Container(
                            //color: Colors.yellow,
                            
                            width: size.width,
                            color: Colors.white,
                            height: MediaQuery.of(context).size.height *0.07,
                            child: 
                                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                InkWell(
                                    onTap: () async =>
                                        {alertBox(context, index,  snapshot.data[index].image,snapshot.data[index].pId)},
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
                                                        right: size.width * 0.45,
                                                        child: Container(
                                                          
                                                          width: size.width * 0.3,
                                                          color: Colors.white,
                                                          child: Text(
                                                            "${snapshot.data[index].productname}",
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
                                                        right: size.width * 0.40,
                                                        child: Container(
                                                          width: size.width*0.1,
                                                          //color: Colors.red,
                                                            child: RichText(
                                                          text: TextSpan(
                                                            style:
                                                                DefaultTextStyle.of(context)
                                                                    .style,
                                                            children: <TextSpan>[
                                                              TextSpan(
                                                                  text:
                                                                      "${snapshot.data[index].price}",
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
                                                        top: size.height * 0.012,
                                                        right: size.width * 0.15,
                                                        child: Container(
                                                            child: RichText(
                                                          text: TextSpan(
                                                            style:
                                                                DefaultTextStyle.of(context)
                                                                    .style,
                                                            children: <TextSpan>[
                                                              TextSpan(
                                                                  text:
                                                                      "${snapshot.data[index].offers}",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight.bold,
                                                                      color: Colors.green,
                                                                      fontSize: 10)),
                                                              TextSpan(
                                                                  text: ' %',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight.bold,
                                                                          color: Colors.red,
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
                                                              snapshot.data[index].image)),
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
                            
                      );
                            
                            });
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
  removeOfferItem(var productId,offer) async {
    await offersBloc.removeOffer(productId,offer);
  }
   alertBox(BuildContext context, int index, var image,id) {
 

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
                  height: MediaQuery.of(context).size.height * 0.45,
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
                                         image), //Image
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
                    
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.10,
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.14,
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
                        height: MediaQuery.of(context).size.height * 0.0160,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0700,
                          width: double.infinity, // match_parent
                          child: FlatButton(
                            color: Colors.black,
                            textColor: Colors.white,
                            onPressed: () {
                              setState(() { 
                                discount =
                                            int.parse(passwordController.text);
                                 removeOfferItem(id, discount);
                               // check();
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