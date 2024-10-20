import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/cart_screen/cart_manager.dart';
import '/favorite_screen/favorites_manager.dart';

class CroissantScreen extends StatefulWidget {
  @override
  State<CroissantScreen> createState() => _croissantScreenState();
}

class _croissantScreenState extends State<CroissantScreen> {
  final double coffeeBackgroundHeight = 300;
  final double mochaTextTopPadding = 10;

  bool isRegularSelected = true; // By default, regular is selected
  double basePrice = 180; // Price for a regular croissant
  int quantity = 1; // Default quantity is 1
  double totalPrice = 180; // Initial total price
  bool isFavorited = false;

  User? currentUser; // Declare user variable

  @override
  void initState() {
    super.initState();
    currentUser = FirebaseAuth.instance.currentUser; // Get current user
    _checkIfFavorited(); // Check if it's favorited
  }

  Future<void> _checkIfFavorited() async {
    if (currentUser != null) { // Check if user is logged in
      List<String> favorites = await FavoritesManager().getFavorites(currentUser!.uid);
      setState(() {
        isFavorited = favorites.contains('Croissant');
      });
    }
  }

  void _toggleFavorite() async {
    if (currentUser != null) { // Check if user is logged in
      if (isFavorited) {
        await FavoritesManager().removeFavorite(currentUser!.uid, 'Croissant');
      } else {
        await FavoritesManager().addFavorite(currentUser!.uid, 'Croissant');
      }
      setState(() {
        isFavorited = !isFavorited;
      });
    }
  }

  void _updateTotalPrice() {
    setState(() {
      totalPrice = basePrice * quantity; // Calculate total price
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF112e12),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFavorited ? Icons.favorite : Icons.favorite_border,
              color: isFavorited ? Colors.red : Colors.white,
            ),
            onPressed: _toggleFavorite, // Toggle favorite status
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: coffeeBackgroundHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/croissant.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: coffeeBackgroundHeight - mochaTextTopPadding),

                // Croissant Label and Description
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Croissant',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          shadows: [
                            Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 3,
                              color: Colors.black.withOpacity(0.2),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      // Croissant Description
                      Text(
                        'Butter, Flour, Yeast, Milk, and Sugar.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 2,
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Separator between description and quantity
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Piece",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                ),

                // Quantity Selector
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
                            _updateTotalPrice();
                          });
                        }
                      },
                      icon: Icon(Icons.remove_circle_outline),
                    ),
                    Text(
                      '$quantity',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          quantity++;
                          _updateTotalPrice();
                        });
                      },
                      icon: Icon(Icons.add_circle_outline),
                    ),
                  ],
                ),
                SizedBox(height: 30),

                // Order Now Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (totalPrice > 0) {
                        // Add the croissant item to the cart
                        CartManager.instance.addItem(
                          'Croissant',
                          totalPrice,
                          'Piece', // Size for piece
                          'Food', // Specify the type
                          quantity, // Pass the selected quantity
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Ordered $quantity piece(s) of Croissant for ₱$totalPrice')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please select a valid quantity')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF112e12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.shopping_cart, color: Colors.white),
                        SizedBox(width: 20),
                        Text(
                          'Order Now',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '₱$totalPrice',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}