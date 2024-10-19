import 'package:flutter/material.dart';
import '/cart_screen/cart_manager.dart'; // Import the cart manager

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartItems = CartManager.instance.cartItems;

    // Calculate total price of items in the cart
    double totalPrice = cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));

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
                  subtitle: Text('${item['type']} - ₱${item['price']} x ${item['quantity']}'),
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
              'Total: ₱$totalPrice',
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