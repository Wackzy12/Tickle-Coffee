import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/cart_screen/cart_manager.dart'; // Ensure you import your CartManager class
import '/favorite_screen/favorites_manager.dart';

class ApplepieScreen extends StatefulWidget {
  @override
  State<ApplepieScreen> createState() => _applepieScreenState();
}

class _applepieScreenState extends State<ApplepieScreen> {
  final double applePieBackgroundHeight = 300;
  final double applePieTextTopPadding = 10;

  bool isRegularSelected = false;
  bool isLargeSelected = false;
  double basePrice = 0;
  double totalPrice = 0;
  int quantity = 1; // Quantity starts at 1
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
        isFavorited = favorites.contains('Apple Pie');
      });
    }
  }

  void _toggleFavorite() async {
    if (currentUser != null) { // Check if user is logged in
      if (isFavorited) {
        await FavoritesManager().removeFavorite(currentUser!.uid, 'Apple Pie');
      } else {
        await FavoritesManager().addFavorite(currentUser!.uid, 'Apple Pie');
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
            height: applePieBackgroundHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/applepie.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: applePieBackgroundHeight - applePieTextTopPadding),

                // Apple Pie Label and Description
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Apple Pie',
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
                      Text(
                        'Pie crust, Apples, Sugar, Cinnamon, Nutmeg, and Butter.',
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

                // Separator between Select Type and Select Size
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
                          "Select Size",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Divider(
                          color: Colors.grey,
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                ),

                // Apple Pie Size Selection (Regular / Large)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isRegularSelected = true;
                          isLargeSelected = false;
                          basePrice = 150; // Set price for Regular
                          _updateTotalPrice();
                        });
                      },
                      child: Container(
                        width: 150,
                        height: 50,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          color: isRegularSelected ? Color(0xFF112e12) : Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Regular',
                            style: TextStyle(
                              color: isRegularSelected ? Colors.white : Color(0xFF112e12),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isLargeSelected = true;
                          isRegularSelected = false;
                          basePrice = 1000; // Set price for Large
                          _updateTotalPrice();
                        });
                      },
                      child: Container(
                        width: 150,
                        height: 50,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          color: isLargeSelected ? Color(0xFF112e12) : Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Large',
                            style: TextStyle(
                              color: isLargeSelected ? Colors.white : Color(0xFF112e12),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

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
                      if (totalPrice > 0 && (isRegularSelected || isLargeSelected)) {
                        String size = isRegularSelected ? 'Regular' : 'Large';

                        // Add the apple pie item to the cart
                        CartManager.instance.addItem(
                          'Apple Pie',
                          totalPrice,
                          size,
                          'Dessert', // Specify the type
                          quantity, // Pass the selected quantity
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Apple Pie added to cart: ₱$totalPrice')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please select a size')),
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