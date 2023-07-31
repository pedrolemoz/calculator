import '../computable.dart';
import '../parser/expression_parser.dart';

class Calculator {
  static num calculate(String expression) {
    final result = ExpressionParser.parseExpression(expression);
    final value = (result as Computable).compute();
    return value;
  }
}
