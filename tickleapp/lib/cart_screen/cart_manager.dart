
class CartManager {
  static final CartManager _instance = CartManager._internal();
  List<Map<String, dynamic>> _cartItems = [];

  CartManager._internal();

  static CartManager get instance => _instance;

  void addItem(String name, double price, String size, String type, int quantity) {
    _cartItems.add({
      'name': name,
      'price': price,
      'size': size,
      'type': type,
      'quantity': quantity,
    });
  }

  void removeItem(int index) {
    if (index >= 0 && index < _cartItems.length) {
      _cartItems.removeAt(index);
    }
  }

  List<Map<String, dynamic>> get cartItems => _cartItems;
}