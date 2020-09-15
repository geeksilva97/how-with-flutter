class Product {
  final int id;
  final String name;
  final double price;

  Product(this.id, this.name, this.price);

   @override
  int get hashCode => id;

  @override
  bool operator ==(other) => other is Product && other.hashCode == hashCode;

  @override
  String toString() => '$name [$id]';
}