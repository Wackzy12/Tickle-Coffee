import 'package:flutter/material.dart';
import 'package:tickleapp/profile_screens/payments_screens/store_credits.dart';

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  // Navigate to the respective screens based on the payment method
  void _navigateToCreditScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddCreditsScreen(),
      ),
    );
  }

  void _navigateToGcashScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddCreditsScreen(),
      ),
    );
  }

  void _navigateToPaypalScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddCreditsScreen(),
      ),
    );
  }

  void _navigateToCardScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddCreditsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      appBar: AppBar(
        title: Text(
          'Payment Methods',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Payment Method",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              title: const Text('Store Credits'),
              onTap: () {
                _navigateToCreditScreen(context);
              },
            ),
            ListTile(
              title: const Text('Gcash QR'),
              onTap: () {
                _navigateToGcashScreen(context);
              },
            ),
            ListTile(
              title: const Text('PayPal'),
              onTap: () {
                _navigateToPaypalScreen(context);
              },
            ),
            ListTile(
              title: const Text('Card'),
              onTap: () {
                _navigateToCardScreen(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}