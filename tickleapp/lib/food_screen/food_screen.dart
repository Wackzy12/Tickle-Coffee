import 'package:flutter/material.dart';

class ToEatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Eat'),
        backgroundColor: Color(0xFF112e12),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildMenuItem(title: 'Pesto Pasta', description: 'Fresh basil and pine nut sauce.'),
            _buildMenuItem(title: 'Caesar Salad', description: 'Classic salad with croutons and dressing.'),
            _buildMenuItem(title: 'Club Sandwich', description: 'Triple-layered sandwich with ham and cheese.'),
            _buildMenuItem(title: 'Chocolate Cake', description: 'Rich and moist chocolate cake.'),
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
      leading: Icon(Icons.restaurant, color: Color(0xFF112e12)),
    );
  }
}