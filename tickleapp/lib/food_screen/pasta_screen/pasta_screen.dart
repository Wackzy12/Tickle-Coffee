import 'package:flutter/material.dart';
import 'carbonara.dart';
import 'lasagna.dart';
import 'macaroni.dart';
import 'ravioli.dart';
import 'spaghetti.dart';

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
          _buildPastaItem(
            context,
            title: 'Lasagna',
            description: 'Flat pasta sheets with meat sauce, Béchamel, and cheese.',
            imagePath: 'assets/lasagna.jpg', // Make sure to have an image for Lasagna
            screen: LasagnaScreen(), // Navigate to LasagnaScreen
          ),
          _buildPastaItem(
            context,
            title: 'Macaroni and cheese',
            description: 'Macaroni, Mixture of melted cheese, Butter, Milk, and Cream.',
            imagePath: 'assets/macaroni.jpg', // Make sure to have an image for Macaroni
            screen: MacaroniScreen(), // Navigate to MacaroniScreen
          ),
          _buildPastaItem(
            context,
            title: 'Ravioli',
            description: 'Stuffed pasta, Cheese, Meat, Vegetables, and Cream-based sauce.',
            imagePath: 'assets/ravioli.jpg', // Make sure to have an image for Ravioli
            screen: RavioliScreen(), // Navigate to RavioliScreen
          ),
          _buildPastaItem(
            context,
            title: 'Spaghetti Bolognese',
            description: 'Spaghetti, Tomatoes, Onions, Carrots, Celery, and Wine.',
            imagePath: 'assets/spaghetti.jpg', // Make sure to have an image for Spaghetti
            screen: SpaghettiScreen(), // Navigate to SpaghettiScreen
          ),
        ],
      ),
    );
  }
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
    child: Card(
      elevation: 4, // Add elevation for shadow effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      margin: EdgeInsets.symmetric(vertical: 10), // Vertical margin between cards
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Padding inside the card
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
      ),
    ),
  );
}