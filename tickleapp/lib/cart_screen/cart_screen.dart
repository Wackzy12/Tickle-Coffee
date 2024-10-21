import 'package:flutter/material.dart';
import '/cart_screen/cart_manager.dart'; // Import the cart manager

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Function to update total price when item quantity changes
  double _calculateTotalPrice() {
    final cartItems = CartManager.instance.cartItems;
    return cartItems.fold(
      0,
          (sum, item) => sum + (item['price'] * item['quantity']),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = CartManager.instance.cartItems;

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
        backgroundColor: Color(0xFF112e12),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  title: Text('${item['name']} (${item['size']})'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${item['type']} - ₱${item['price']} each'),
                      Row(
                        children: [
                          // Quantity Decrease Button
                          IconButton(
                            icon: Icon(Icons.remove_circle_outline),
                            onPressed: () {
                              setState(() {
                                if (item['quantity'] > 1) {
                                  item['quantity']--;
                                  // Update total price when quantity changes
                                  _calculateTotalPrice();
                                }
                              });
                            },
                          ),
                          // Display Quantity
                          Text(
                            '${item['quantity']}',
                            style: TextStyle(fontSize: 18),
                          ),
                          // Quantity Increase Button
                          IconButton(
                            icon: Icon(Icons.add_circle_outline),
                            onPressed: () {
                              setState(() {
                                item['quantity']++;
                                // Update total price when quantity changes
                                _calculateTotalPrice();
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        CartManager.instance.removeItem(index);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${item['name']} removed from cart')),
                      );
                    },
                  ),
                );
              },
            ),
          ),

          // Total Price Display
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total: ₱${_calculateTotalPrice()}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          // Checkout Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Implement the checkout logic here
                // For now, we just show a snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Proceeding to checkout')),
                );
                // Here, you could navigate to a checkout page or process the order
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF112e12),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(
                'Checkout',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}