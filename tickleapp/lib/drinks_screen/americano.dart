import 'package:flutter/material.dart';
import '../cart_screen/cart_manager.dart'; // Import the cart manager

class AmericanoScreen extends StatefulWidget {
  @override
  State<AmericanoScreen> createState() => _AmericanoScreenState();
}

class _AmericanoScreenState extends State<AmericanoScreen> {
  final double coffeeBackgroundHeight = 300;
  final double mochaTextTopPadding = 10;

  bool isHotSelected = false;
  bool isIcedSelected = false;
  bool isRegularSelected = false;
  bool isLargeSelected = false;
  double price = 0;

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
      ),
      body: Stack(
        children: [
          Container(
            height: coffeeBackgroundHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/americano.jpg'),
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

                // Americano Label and Description
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Americano',
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
                        'Smooth, bold, and less intense than straight espresso but still carries its depth and complexity',
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
                          "Select Type",
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

                // Coffee Type Selection (Hot / Iced)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isHotSelected = true;
                          isIcedSelected = false;
                        });
                      },
                      child: Container(
                        width: 150,
                        height: 50,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          color: isHotSelected ? Color(0xFF112e12) : Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Hot',
                            style: TextStyle(
                              color: isHotSelected ? Colors.white : Color(0xFF112e12),
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
                          isIcedSelected = true;
                          isHotSelected = false;
                        });
                      },
                      child: Container(
                        width: 150,
                        height: 50,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          color: isIcedSelected ? Color(0xFF112e12) : Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Iced',
                            style: TextStyle(
                              color: isIcedSelected ? Colors.white : Color(0xFF112e12),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                // Coffee Size Selection (Regular / Large)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isRegularSelected = true;
                          isLargeSelected = false;
                          price = 120; // Price for Regular
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
                            '12oz',
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
                          price = 140; // Price for Large
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
                            '16oz',
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
                SizedBox(height: 30),

                // Order Now Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (price > 0 &&
                          (isHotSelected || isIcedSelected) &&
                          (isRegularSelected || isLargeSelected)) {
                        String type = isHotSelected ? 'Hot' : 'Iced';
                        String size = isRegularSelected ? '12oz' : '16oz';

                        CartManager.instance.addItem(
                          'Americano',
                          price,
                          size,
                          type,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Americano added to cart')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please select all options')),
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
                          '₱$price',
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