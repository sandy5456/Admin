import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
//import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:kafe/BLOC/additem_Bloc.dart';
import 'package:kafe/BLOC/statmanagment.dart';
import 'package:kafe/WIDGETS/catogery_list.dart';
import 'package:kafe/WIDGETS/image_picker.dart';

class AddItem extends StatefulWidget {
  String image;
  AddItem({this.image});
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  double cost;
  int discount;
  String name, email, mobile, password;
  final _key = new GlobalKey<FormState>();

  bool _secureText = false;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check(double cost, int pricetag) {
    final form = _key.currentState;
    if (form.validate() &&
        stateManagmentData.image != null &&
        stateManagmentData.itemcatogery != null) {
      // form.save();
      // save();

      addItem(stateManagmentData.itemcatogery, nameController.text, cost,
          pricetag, stateManagmentData.image);
      print("image data is");
      Fluttertoast.showToast(
          msg: "added succefully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white);
      // print(stateManagmentData.image);
    } else {
      return Fluttertoast.showToast(
          msg: "select item Catogery & item Image ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIos: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white);
    }
  }

  registerToast(String toast) {
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context, false),
        ),
        backgroundColor: Colors.white,
        title: Text("ADD NEW ITEM",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Abel')),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(15.0),
          children: <Widget>[
            Center(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.white,
                child: Form(
                  key: _key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          color: Colors.white,
                          height: MediaQuery.of(context).size.height * 0.20,
                          child: SingleImageUpload()),
                      SizedBox(
                        height: 20,
                      ),

                      //card for Fullname TextFormField validator: (e) {
                      //   if (e.isEmpty) {
                      //     return "Please insert Full Name";
                      //   }
                      // },
                      // onSaved: (e) => name = e,
                      Container(
                        //Tags
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.060,
                        child: JsonApiDropdown(),
                      ),
                      Container(
                        color: Colors.white12,
                        height: MediaQuery.of(context).size.height * 0.05,
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
                            hintStyle: TextStyle(color: Colors.black26),
                            fillColor: Colors.black,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black12, width: 0.5),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0.0)),
                                borderSide: BorderSide(
                                  color: Colors.black12,
                                )),
                            hintText: "  item name",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),

                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.12,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.30,
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
                                hintStyle: TextStyle(color: Colors.black26),
                                fillColor: Colors.black,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black12, width: 0.5),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(0.0)),
                                    borderSide: BorderSide(
                                      color: Colors.black12,
                                    )),
                                hintText: "  price",
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.04,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.30,
                            child: TextFormField(
                                textAlignVertical: TextAlignVertical.bottom,
                                textAlign: TextAlign.start,
                                cursorColor: Colors.black,
                                controller: passwordController,
                                obscureText: _secureText,
                                onSaved: (e) => password = e,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(color: Colors.black26),
                                  fillColor: Colors.black,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black12, width: 0.5),
                                    borderRadius: BorderRadius.circular(1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(1.0)),
                                      borderSide: BorderSide(
                                        color: Colors.black12,
                                      )),
                                  hintText: "  offer     %",
                                ),
                                keyboardType: TextInputType.number),
                          ),
                        ],
                      ),

                      //card for Password TextFormField

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),

                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: Container(
                              //height: MediaQuery.of(context).size.height * 0.01,
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0.0)),
                                  child: Text('SUBMIT',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontFamily: 'Abel')),
                                  textColor: Colors.white,
                                  color: Colors.black, //Color(0xFFf7d426),
                                  onPressed: () {
                                    setState(() {
                                      if (phoneNumberController.text == null ||
                                          phoneNumberController.text == "") {
                                        return Fluttertoast.showToast(
                                            msg: "fill the details ",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.TOP,
                                            timeInSecForIos: 1,
                                            backgroundColor: Colors.black,
                                            textColor: Colors.white);
                                      }

                                      cost = double.parse(
                                          phoneNumberController.text);

                                      if (passwordController.text == null ||
                                          passwordController.text == "") {
                                        check(cost, 0);
                                      } else {
                                        discount =
                                            int.parse(passwordController.text);
                                        return check(cost, discount);
                                      }
                                    });

                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => Login()),
                                    // );
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  addItem(var id, name, price, offer, image) async {
    await additemBloc.addItemPost(id, name, price, offer, image);
  }
}
