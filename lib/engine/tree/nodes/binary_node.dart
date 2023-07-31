import '../tree_element.dart';

class BinaryNode implements TreeElement {
  final TreeElement left;
  final TreeElement right;

  const BinaryNode({required this.left, required this.right});
}
