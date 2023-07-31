import '../computable.dart';
import '../tree/leaf.dart';

class Number extends Leaf<num> implements Computable<num> {
  const Number({required super.value});

  @override
  num compute() => value;
}
