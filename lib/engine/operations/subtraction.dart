import '../computable.dart';
import '../exceptions/uncomputable_node_exception.dart';
import '../tree/nodes/binary_node.dart';

class Subtraction extends BinaryNode implements Computable<num> {
  const Subtraction({required super.left, required super.right});

  @override
  num compute() {
    if (left is! Computable || right is! Computable) {
      throw UncomputableNodeException();
    }

    final leftResult = (left as Computable).compute();
    final rightResult = (right as Computable).compute();

    return leftResult - rightResult;
  }
}
