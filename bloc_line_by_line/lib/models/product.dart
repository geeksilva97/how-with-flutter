class Product {
  final int id;
  final String name;

  Product(this.id, this.name);

   @override
  int get hashCode => id;

  @override
  bool operator ==(other) => other is Product && other.hashCode == hashCode;

  @override
  String toString() => '$name [$id]';
}