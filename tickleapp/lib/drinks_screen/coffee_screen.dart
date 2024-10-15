import 'package:flutter/material.dart';
import 'mocha.dart';
import 'latte.dart';
import 'americano.dart';
import 'wmocha.dart';
import 'caramel.dart';

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
          _buildCoffeeItem(
            context,
            title: 'Cafe Latte',
            description: 'Latte is a smooth and creamy coffee made with a shot of espresso and steamed milk.',
            imagePath: 'assets/latte.jpg',
            screen: LatteScreen(), // Navigate to LatteScreen
          ),
          _buildCoffeeItem(
            context,
            title: 'Americano',
            description: 'Americano coffee is made by diluting a shot of espresso with hot water, creating a smooth, rich drink with a milder strength than straight espresso.',
            imagePath: 'assets/americano.jpg',
            screen: AmericanoScreen(), // Navigate to AmericanoScreen
          ),
          _buildCoffeeItem(
            context,
            title: 'White Mocha',
            description: 'Creamy, sweet coffee drink combining espresso, steamed milk, and white chocolate syrup for a rich, smooth flavor.',
            imagePath: 'assets/wmocha.jpg',
            screen: WhiteMochaScreen(), // Navigate to WhiteMochaScreen
          ),
          _buildCoffeeItem(
            context,
            title: 'Caramel',
            description: 'Rich and sweet coffee beverage featuring espresso, steamed milk, and a drizzle of caramel syrup, offering a delightful blend of flavors.',
            imagePath: 'assets/caramel.jpg',
            screen: CaramelScreen(), // Navigate to CaramelScreen
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