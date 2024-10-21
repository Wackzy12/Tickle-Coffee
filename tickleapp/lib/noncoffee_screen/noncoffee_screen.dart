import 'package:flutter/material.dart';
import 'chai.dart';
import 'earlgrey.dart';
import 'hibiscus.dart';
import 'lemonpeach.dart';
import 'matcha.dart';

class NonCoffeeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Non-Coffee',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF112e12),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
          _buildNonCoffeeItem(
            context,
            title: 'Earl Grey Tea',
            description: 'Fragrant black tea flavored with oil from the rind of bergamot oranges, giving it a distinctive citrus aroma and flavor.',
            imagePath: 'assets/earlgrey.jpg', // Make sure to have an image for Earl Grey
            screen: EarlgreyScreen(), // Navigate to EarlGreyScreen
          ),
          _buildNonCoffeeItem(
            context,
            title: 'Hibiscus Tea',
            description: 'Herbal tea made from the dried petals of the hibiscus flower served with lemon or ginger.',
            imagePath: 'assets/hibiscus.jpg', // Make sure to have an image for Hibiscus
            screen: HibiscusScreen(), // Navigate to HibiscusScreen
          ),
          _buildNonCoffeeItem(
            context,
            title: 'Lemon Peach Tea',
            description: 'A refreshing beverage made green tea with fresh lemon juice and peach flavor or slices.',
            imagePath: 'assets/lemonpeach.jpg', // Make sure to have an image for Lemon Peach
            screen: LemonpeachScreen(), // Navigate to LemonPeachScreen
          ),
          _buildNonCoffeeItem(
            context,
            title: 'Matcha Latte',
            description: 'Made by combining matcha powder with steamed milk.',
            imagePath: 'assets/matcha.jpg', // Make sure to have an image for Matcha
            screen: MatchaScreen(), // Navigate to MatchaScreen
          ),
        ],
      ),
    );
  }
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
    child: Card(
      color: Colors.white,
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