import 'package:math_expressions/math_expressions.dart';

class CalcLogic {
  static String _result = "0";

  static void doButton(String label) {
    if (label == "=") {
      Parser parser = new Parser();
      Expression expression = parser.parse(_result);
      ContextModel model = new ContextModel();
      _result = expression.evaluate(EvaluationType.REAL, model).toString();
    } else if (label == "C") {
      _result = "0";
    } else {
      if (_result == "0") {
        _result = label;
      } else {
        _result += label;
      }
    }
  }

  static String getResult() {
    return _result;
  }
}
