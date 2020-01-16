import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kafe/BLOC/edit_Item_bloc.dart';
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
    String name, email, mobile, password;
  alertBox(BuildContext context, int index, var cId, productId, image) {
    

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
                                nameController.text == "" &&
                                        phoneNumberController.text == "" &&
                                        passwordController.text == ""
                                    ? Fluttertoast.showToast(
                                        msg: "Enter name & Price ",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIos: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white)
                                    : nameController.text == "" ||
                                            phoneNumberController.text == ""
                                        ? Fluttertoast.showToast(
                                            msg: "Enter name & Price ",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIos: 1,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white)
                                        : passwordController.text == ""
                                            ? check(context,
                                                cId,
                                                productId,
                                                image,
                                                nameController.text,
                                                phoneNumberController.text,
                                                "0")
                                            : check(context,
                                                cId,
                                                productId,
                                                image,
                                                nameController.text,
                                                phoneNumberController.text,
                                                passwordController.text);

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

  check(BuildContext context,cId, productId, image, name, price, offer) {
    double cost;
    int discount;
    cost = double.parse(price);
    discount = int.parse(offer);

    if (nameController.text != "" && phoneNumberController.text != "") {
      editItem(cId, productId, nameController.text, cost, discount, image);
      print(cost);
      print(discount);
      Navigator.of(context).pop();
      // print(stateManagmentData.image);
    } else {
      return Fluttertoast.showToast(
          msg: "Enter name & Price ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white);
    }
  }

  editItem(var cId, productId, name, price, offers, image) async {
    await editItemBloc.editItemPost(cId, productId, name, price, offers, image);
  }



