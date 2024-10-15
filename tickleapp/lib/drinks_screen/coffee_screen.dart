import 'package:flutter/material.dart';
import 'mocha.dart';

class CoffeeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee'),
        backgroundColor: Color(0xFF112e12),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildCoffeeItem(
            context,
            title: 'Mocha',
            description: 'A rich, sweet blend of bold coffee and creamy chocolate.',
            imagePath: 'assets/mocha.jpg',
            screen: MochaScreen(), // Navigate to MochaScreen
          ),
          SizedBox(height: 20),
          _buildCoffeeItem(
            context,
            title: 'Latte',
            description: 'A classic combination of espresso and steamed milk.',
            imagePath: 'assets/latte.jpg',
            screen: MochaScreen(), // Replace with appropriate screen for Latte
          ),
          SizedBox(height: 20),
          _buildCoffeeItem(
            context,
            title: 'Cappuccino',
            description: 'Espresso topped with steamed milk foam.',
            imagePath: 'assets/cappuccino.jpg',
            screen: MochaScreen(), // Replace with appropriate screen for Cappuccino
          ),
        ],
      ),
    );
  }

  Widget _buildCoffeeItem(
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