import 'package:flutter/material.dart';
import 'pasta_screen/pasta_screen.dart';
import 'pastry_screen/pastry_screen.dart';

class FoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Menu'),
        backgroundColor: Color(0xFF112e12),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildFoodItem(
            context,
            title: 'Pasta',
            description: 'Delicious pasta with rich sauces.',
            imagePath: 'assets/pasta.jpg',
            screen: PastaScreen(), // Navigate to PastaScreen
          ),
          SizedBox(height: 20),
          _buildFoodItem(
            context,
            title: 'Pastries',
            description: 'Freshly baked pastries and sweets.',
            imagePath: 'assets/pastries.jpg',
            screen: PastryScreen(), // Navigate to PastriesScreen
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItem(
      BuildContext context, {
        required String title,
        required String description,
        required String imagePath,
        required Widget screen,
      }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(imagePath),
            backgroundColor: Colors.transparent,
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
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