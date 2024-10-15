import 'package:flutter/material.dart';

class NonCoffeeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Non-Coffee'),
        backgroundColor: Color(0xFF112e12),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildMenuItem(title: 'Lemonade', description: 'Refreshing lemon drink.'),
            _buildMenuItem(title: 'Iced Tea', description: 'Chilled tea with lemon or peach.'),
            _buildMenuItem(title: 'Smoothie', description: 'Fruit-blended drink.'),
            _buildMenuItem(title: 'Hot Chocolate', description: 'Warm milk with chocolate.'),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({required String title, required String description}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(description),
      leading: Icon(Icons.local_drink, color: Color(0xFF112e12)),
    );
  }
}