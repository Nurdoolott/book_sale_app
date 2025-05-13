class CartItem {
  final String id;
  final String title;
  final double price;
  final int count;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.count,
  });

  CartItem copyWith({int? count}) {
    return CartItem(
      id: id,
      title: title,
      price: price,
      count: count ?? this.count,
    );
  }
}
