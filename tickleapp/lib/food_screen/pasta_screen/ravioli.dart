import 'package:flutter/material.dart';

class RavioliScreen extends StatefulWidget {
  @override
  State<RavioliScreen> createState() => _ravioliScreenState();
}

class _ravioliScreenState extends State<RavioliScreen> {

  final double coffeeBackgroundHeight = 300;
  final double mochaTextTopPadding = 10;

  bool isRegularSelected = false;
  bool isLargeSelected = false;
  double basePrice = 0;
  double totalPrice = 0;
  int quantity = 1; // Quantity starts at 1

  void _updateTotalPrice() {
    setState(() {
      totalPrice = basePrice * quantity;
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
      ),
      body: Stack(
        children: [
          Container(
            height: coffeeBackgroundHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/ravioli.jpg'),
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

                // Mocha Label and Description
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Ravioli',
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
                      // Mocha Description
                      Text(
                        'Stuffed pasta, Cheese, Meat, Vegetables, and Cream-based sauce.\n Regular = 1 Person.\n Large = 2-3 Persons.',
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


                // Coffee Size Selection (Regular / Large)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isRegularSelected = true;
                          isLargeSelected = false;
                          basePrice = 250; // Set price for Regular
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
                          basePrice = 350; // Set price for Large
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
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Carbonara ordered: ₱$totalPrice')),
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
