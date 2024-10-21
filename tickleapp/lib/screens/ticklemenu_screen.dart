import 'package:flutter/material.dart';
import '../drinks_screen/coffee_screen.dart';
import '../food_screen/food_screen.dart';
import '../noncoffee_screen/noncoffee_screen.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }

  Widget _buildMenuItem({
    required String imagePath,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(imagePath),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
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