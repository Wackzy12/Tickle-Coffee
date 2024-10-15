import 'package:flutter/material.dart';
import 'carbonara.dart';

class PastaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pasta Options'),
        backgroundColor: Color(0xFF112e12),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildPastaItem(
            context,
            title: 'Carbonara',
            description: 'Spaghetti noodles, Eggs, Pecorino Romano cheese, Guanciale, and Black pepper.',
            imagePath: 'assets/carbonara.jpg', // Make sure to have an image for Carbonara
            screen: CarbonaraScreen(), // Navigate to CarbonaraScreen
          ),
          // Add other pasta items here
        ],
      ),
    );
  }

  Widget _buildPastaItem(
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