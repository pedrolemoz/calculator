import 'tree_element.dart';

class Leaf<T extends Object> implements TreeElement {
  final T value;

  const Leaf({required this.value});
}
