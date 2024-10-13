import 'package:flutter/material.dart';

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
            ),
            SizedBox(height: 20),
            _buildMenuItem(
              imagePath: 'assets/lemonade_menu.jpg',
              title: 'NON-COFFEE',
            ),
            SizedBox(height: 20),
            _buildMenuItem(
              imagePath: 'assets/pesto_menu.jpg',
              title: 'TO EAT',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({required String imagePath, required String title}) {
    return Row(
      children: [
        CircleAvatar(
          radius: 100, // Decrease radius for smaller image
          backgroundImage: AssetImage(imagePath),
          backgroundColor: Colors.transparent,
        ),
        SizedBox(width: 20), // Space between the image and text
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black, // Adjusted text color for better contrast
            fontWeight: FontWeight.bold, // Bolder font for emphasis
          ),
        ),
      ],
    );
  }
}
