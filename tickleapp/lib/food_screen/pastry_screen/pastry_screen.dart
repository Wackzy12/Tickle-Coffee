import 'package:flutter/material.dart';
import 'applepie.dart';
import 'chocolat.dart';
import 'cinnamon.dart';
import 'cookies.dart';
import 'croissant.dart';


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
            imagePath: 'assets/applepie.jpg', // Make sure to have an image for Apple Pie
            screen: ApplepieScreen(), // Navigate to ApplepieScreen
          ),
          _buildPastryItem(
            context,
            title: 'Pan Eu Chocolat ',
            description: 'Cocoa, Sugar, Milk, Cocoa butter, and Vanilla.',
            imagePath: 'assets/chocolat.jpg', // Make sure to have an image for Chocolat
            screen: ChocolatScreen(), // Navigate to ChocolatScreen
          ),
          _buildPastryItem(
            context,
            title: 'Cinnamon Roll',
            description: 'Dough, Cinnamon, Brown sugar, Butter, and Cream cheese frosting.',
            imagePath: 'assets/cinnamon.jpg', // Make sure to have an image for Cinnamon Roll
            screen: CinnamonScreen(), // Navigate to CinnamonScreen
          ),
          _buildPastryItem(
            context,
            title: 'Cookies',
            description: 'Flour, Sugar, Butter, Eggs, and Vanilla extract.',
            imagePath: 'assets/cookies.jpg', // Make sure to have an image for Cookies
            screen: CookiesScreen(), // Navigate to CookiesScreen
          ),
          _buildPastryItem(
            context,
            title: 'Croissant',
            description: 'Butter, Flour, Yeast, Milk, and Sugar.',
            imagePath: 'assets/croissant.jpg', // Make sure to have an image for Croissant
            screen: CroissantScreen(), // Navigate to CroissantScreen
          ),
        ],
      ),
    );
  }
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
