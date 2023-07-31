import '../exceptions/parsing_exception.dart';
import '../operations/addition.dart';
import '../operations/division.dart';
import '../operations/multiplication.dart';
import '../operations/subtraction.dart';
import '../tree/tree_element.dart';
import '../values/number.dart';

class ExpressionParser {
  static const _numbers = '0123456789.';

  static TreeElement parseExpression(
    String expression, [
    TreeElement? element,
  ]) {
    if (expression.isEmpty) {
      if (element != null) return element;
      throw ParsingException();
    }

    final currentSymbol = expression[0];

    final symbolIsANumber = _numbers.contains(currentSymbol);
    final symbolIsAddittionOperator = currentSymbol == '+';
    final symbolIsSubtractionOperator = currentSymbol == '-';
    final symbolIsMultiplicationOperator = currentSymbol == '*';
    final symbolIsDivisionOperator = currentSymbol == '/';

    if (symbolIsANumber) {
      final (value, index) = parseNumber(currentSymbol, expression);

      return parseExpression(
        expression.substring(index),
        Number(value: value),
      );
    }

    if (symbolIsAddittionOperator) {
      final remaningExpression = expression.substring(1);
      if (remaningExpression.isEmpty) throw ParsingException();
      final left = element!;
      final right = parseExpression(remaningExpression, element);
      return Addition(left: left, right: right);
    }

    if (symbolIsSubtractionOperator) {
      final remaningExpression = expression.substring(1);
      if (remaningExpression.isEmpty) throw ParsingException();
      final left = element!;
      final right = parseExpression(remaningExpression, element);
      return Subtraction(left: left, right: right);
    }

    if (symbolIsMultiplicationOperator) {
      final remaningExpression = expression.substring(1);
      if (remaningExpression.isEmpty) throw ParsingException();
      final left = element!;
      final right = parseExpression(remaningExpression, element);
      return Multiplication(left: left, right: right);
    }

    if (symbolIsDivisionOperator) {
      final remaningExpression = expression.substring(1);
      if (remaningExpression.isEmpty) throw ParsingException();
      final left = element!;
      final right = parseExpression(remaningExpression, element);
      return Division(left: left, right: right);
    }

    return element!;
  }

  static (num, int) parseNumber(String currentSymbol, String expression) {
    final buffer = StringBuffer(currentSymbol);

    var index = 1;

    while (index < expression.length && _numbers.contains(expression[index])) {
      buffer.write(expression[index]);
      index++;
    }

    final value = num.parse(buffer.toString());

    return (value, index);
  }
}
