class CartManager {
  static final CartManager _instance = CartManager._internal();
  List<Map<String, dynamic>> _cartItems = [];

  CartManager._internal();

  static CartManager get instance => _instance;

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addItem(String name, double price, String size, String type) {
    _cartItems.add({
      'name': name,
      'price': price,
      'size': size,
      'type': type,
    });
  }

  void clearCart() {
    _cartItems.clear();
  }

  void removeItem(int index) {
    _cartItems.removeAt(index);
  }
}