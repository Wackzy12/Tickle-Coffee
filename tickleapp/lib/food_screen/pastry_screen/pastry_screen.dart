import 'package:flutter/material.dart';
import 'applepie.dart';

class PastryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pastry Options'),
        backgroundColor: Color(0xFF112e12),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildPastryItem(
            context,
            title: 'Apple Pie',
            description: 'Pie crust, Apples, Sugar, Cinnamon, Nutmeg, and Butter.',
            imagePath: 'assets/apple_pie.jpg', // Make sure to have an image for Apple Pie
            screen: ApplepieScreen(), // Navigate to ApplepieScreen
          ),
          // Add other pastry items here
        ],
      ),
    );
  }

  Widget _buildPastryItem(
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