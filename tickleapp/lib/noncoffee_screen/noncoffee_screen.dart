import 'package:flutter/material.dart';
import 'chai.dart';

class NonCoffeeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Non-Coffee Options'),
        backgroundColor: Color(0xFF112e12),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildNonCoffeeItem(
            context,
            title: 'Chai',
            description: 'Black tea with aromatic spices, milk, and sweetener.',
            imagePath: 'assets/chai.jpg', // Make sure to have an image for Chai
            screen: ChaiScreen(), // Navigate to ChaiScreen
          ),
          // Add other non-coffee items here
        ],
      ),
    );
  }

  Widget _buildNonCoffeeItem(
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