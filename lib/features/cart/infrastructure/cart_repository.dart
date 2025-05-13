import '../domain/cart_item.dart';

class CartRepository {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  void addToCart(CartItem item) {
    final index = _items.indexWhere((e) => e.id == item.id);
    if (index != -1) {
      _items[index] = _items[index].copyWith(
        count: _items[index].count + item.count,
      );
    } else {
      _items.add(item);
    }
  }

  void removeFromCart(String id) {
    _items.removeWhere((e) => e.id == id);
  }

  void clearCart() {
    _items.clear();
  }
}
