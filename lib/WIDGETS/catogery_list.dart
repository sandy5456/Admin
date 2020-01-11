import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:kafe/BLOC/statmanagment.dart';

class ListPropertyTags extends StatefulWidget {
  ListPropertyTags({Key key}) : super(key: key);

  @override
  _ListPropertyTagsState createState() => new _ListPropertyTagsState();
}

class _ListPropertyTagsState extends State<ListPropertyTags> {
  List _types = [
    "select catogery",
    "HOT DRINKS",
    "COLD DRINKS",
    "APPWTIZER",
    "BREAKFAST",
    "SALAD",
    "SANDWICH",
    "PASTA",
    "MAIN COURSE",
    "BURGER",
    "DESSERT",
    "SOFT DRINKS",
  ];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentType;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentType = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in _types) {
      items.add(new DropdownMenuItem(value: city, child: new Text(city)));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /*appBar: AppBar(
      title: Text("City",style: TextStyle(color: Colors.black),),
      backgroundColor: Colors.white,
      elevation: 00,
    ),*/
      body: new Container(
        //color: Colors.white,
        decoration: new BoxDecoration(
          border: new Border.all(
            color: Colors.grey[350],
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(const Radius.circular(0.0)),
        ),
        width: MediaQuery.of(context).size.width * 0.99,
        height: MediaQuery.of(context).size.height * 0.05,
        child: new Center(
            child: Theme(
          data: new ThemeData(
              canvasColor: Colors.white,
              primaryColor: Colors.white,
              accentColor: Colors.white,
              hintColor: Colors.black),
          child: new DropdownButton(
            underline: Container(
              decoration: const BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: Colors.transparent))),
            ),
            iconEnabledColor: Colors.black26,
            style:
                TextStyle(color: Colors.black, decorationColor: Colors.white),
            value: _currentType,
            items: _dropDownMenuItems,
            onChanged: changedDropDownItem,
          ),
        )),
      ),
    );
  }

  void changedDropDownItem(String selectedType) async {
    setState(() {
      _currentType = selectedType;
    });
    await stateManagmentData.setitemCatageryvalue(selectedType);
    print( stateManagmentData.itemcatogery);
    //dataofAddingProperty.setBedRooomCount(120);
  }
}
