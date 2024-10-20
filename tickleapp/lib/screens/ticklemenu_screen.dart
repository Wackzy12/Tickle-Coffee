import 'package:flutter/material.dart';
import '../drinks_screen/coffee_screen.dart';
import '../food_screen/food_screen.dart';
import '../noncoffee_screen/noncoffee_screen.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF112e12),
        automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'Menu',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Centering items
          children: [
            _buildMenuItem(
              imagePath: 'assets/coffee_menu.jpg',
              title: 'COFFEE',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CoffeeScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            _buildMenuItem(
              imagePath: 'assets/lemonade_menu.jpg',
              title: 'NON-COFFEE',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NonCoffeeScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            _buildMenuItem(
              imagePath: 'assets/pesto_menu.jpg',
              title: 'TO EAT',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FoodScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required String imagePath,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap, // Trigger navigation when tapped
      child: Card(
        elevation: 4, // Shadow effect
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Padding inside the card
          child: Row(
            children: [
              CircleAvatar(
                radius: 50, // Adjusted radius for smaller image
                backgroundImage: AssetImage(imagePath),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(width: 20), // Space between the image and text
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black, // Adjusted text color for better contrast
                    fontWeight: FontWeight.bold, // Bolder font for emphasis
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}