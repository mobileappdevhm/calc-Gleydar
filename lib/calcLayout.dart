import 'package:calculator/calcLogic.dart';
import 'package:flutter/material.dart';

class CalcHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Calculator'),
          backgroundColor: Colors.amber[100],
        ),
        body: new CalcLayout(),
        backgroundColor: Colors.pink[100],);
  }
}

class CalcLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new CalcState();
}

var _text = "0";

class CalcState extends State<CalcLayout> {
  @override
  Widget build(BuildContext context) {
    return new Column(children: getColumns());
  }

  List<Widget> getColumns() {
    var labels = [
      "1", "2", "3", "+",
      "4", "5", "6", "-",
      "7", "8", "9", "*",
      "C", "0", "=", "/",
      ""];

    List<Widget> list = new List<Widget>();

    list.add( new SingleChildScrollView(
      child: new Center(
        child: new Text(
          "$_text",
          style: new TextStyle(fontSize: 40.0),
          maxLines: 1,
        ),
        heightFactor: 2.0,
      ),
      scrollDirection: Axis.horizontal,
      reverse: true,
      controller: new ScrollController(),
    ),
    );

    void onButton(String label) {
      setState(() {
        CalcLogic.doButton(label);
        _text = CalcLogic.getResult();
      });
    }

    for (int i = 0; i < 4; i++) {
      list.add(
          new Expanded(
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: new List<Widget>.generate(4, (ind) {
                var row = labels.sublist(i * 4, i * 4 + 4);
                var text = row[ind];
                return new Expanded(
                    child: new RaisedButton(
                        onPressed: () {
                          onButton(text);
                        },
                        child: new Text('$text'),
                        color: ind == 3 ? Colors.blue[200] : Colors.lime[100]
                    )
                );
              }
                        )
            )
          )
      );
    }

    return list;
  }
}