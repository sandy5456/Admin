import 'package:flutter/material.dart';
class Testing extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[Flexible(child: CardList()), Flexible(child: MyList())],
        ),
      ),
    );
  }
}

Widget CardList() {
  return SingleChildScrollView(
    child: ExpansionTile(
        title: Text(
          "Periodo",
          style: new TextStyle(),
          textAlign: TextAlign.center,
        ),
        children: <Widget>[
          ListTile(
            title: Text(
              "Periodo 1",
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            title: Text(
              "Periodo 2",
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            title: Text(
              "Periodo 3",
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            title: Text(
              "Periodo 4",
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            title: Text(
              "Periodo 5",
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            title: Text(
              "Periodo 6",
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            title: Text(
              "Periodo 7",
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            title: Text(
              "Periodo 8",
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            title: Text(
              "Periodo 9",
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            title: Text(
              "Periodo 10",
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            title: Text(
              "Periodo 11",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    
  );
}

Widget MyList() {
  return new ListView(
    shrinkWrap: true,
    children: <Widget>[
      ListTile(
        title: Text(
          "Teste",
          textAlign: TextAlign.center,
        ),
      ),
      Divider(),
      ListTile(
        title: Text(
          "Teste",
          textAlign: TextAlign.center,
        ),
      ),
      Divider(),
      ListTile(
        title: Text(
          "Teste",
          textAlign: TextAlign.center,
        ),
      ),
      Divider(),
      ListTile(
        title: Text(
          "Teste",
          textAlign: TextAlign.center,
        ),
      ),
      Divider(),
      ListTile(
        title: Text(
          "Teste",
          textAlign: TextAlign.center,
        ),
      ),
      Divider(),
      ListTile(
        title: Text(
          "Teste",
          textAlign: TextAlign.center,
        ),
      ),
      Divider(),
      ListTile(
        title: Text(
          "Teste",
          textAlign: TextAlign.center,
        ),
      ),
      Divider(),
      ListTile(
        title: Text(
          "Teste",
          textAlign: TextAlign.center,
        ),
      ),
      Divider(),
      ListTile(
        title: Text(
          "Teste",
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}