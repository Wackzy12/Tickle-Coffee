import 'package:flutter/material.dart';
import 'cart_manager.dart'; // Import the cart manager

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartItems = CartManager.instance.cartItems;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Color(0xFF112e12),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: cartItems.isEmpty
            ? Center(
          child: Text(
            'Your cart is empty',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Items in Cart',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return ListTile(
                    title: Text(
                      '${item['name']} (${item['size']}, ${item['type']})',
                    ),
                    subtitle: Text('₱${item['price']}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          CartManager.instance.removeItem(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${item['name']} removed from cart'),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    CartManager.instance.clearCart();
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Cart cleared')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Background color
                ),
                child: Text('Clear Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}