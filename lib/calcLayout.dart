import 'package:flutter/material.dart';

class CalcHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Calculator'),
        ),
        body: new CalcLayout());
  }
}

class ResultString extends StatefulWidget {
  @override
  createState() => new ResultState();

}

class ResultState extends State<ResultString> {
  @override
  Widget build(BuildContext context) {
    return new Center(child:
      new Text("I bims", style: new TextStyle(fontSize: 40.0),)
      , heightFactor: 2.0,);
  }

}

class CalcLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Column(children: getColumns());
  }

  List<Widget> getColumns() {
    List<Widget> list = new List<Widget>();

    list.add(new ResultString());
    for(int i = 0; i < 3; i++) {
        list.add(
            new Expanded(
                child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: new List<Widget>.generate(3, (ind) {
                      int text = i * 3 + ind + 1;
          return new Expanded(child:
            new RaisedButton(
                onPressed: null,
                child: new Text('$text')));
        }))));

    }

    return list;
  }

}


