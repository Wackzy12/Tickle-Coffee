import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String _selectedPaymentMethod = 'Cash';
  final TextEditingController _cardNumberController = TextEditingController();

  void _submitPayment() {
    if (_selectedPaymentMethod == 'Cash') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Payment method: Cash')),
      );
    } else if (_selectedPaymentMethod == 'Card') {
      if (_cardNumberController.text.isEmpty || _cardNumberController.text.length != 16) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter a valid 16-digit card number')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Payment method: Card\nCard Number: ${_cardNumberController.text}')),
        );
      }
    } else if (_selectedPaymentMethod == 'Gcash') {
      // Logic for Gcash QR handling (e.g., redirect to QR scanner)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Payment method: Gcash QR')),
      );
    } else if (_selectedPaymentMethod == 'PayPal') {
      // Logic for PayPal handling (e.g., redirect to PayPal payment page)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Payment method: PayPal')),
      );
    }
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Method'),
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
              title: const Text('Cash'),
              leading: Radio<String>(
                value: 'Cash',
                groupValue: _selectedPaymentMethod,
                onChanged: (String? value) {
                  setState(() {
                    _selectedPaymentMethod = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Gcash QR'),
              leading: Radio<String>(
                value: 'Gcash',
                groupValue: _selectedPaymentMethod,
                onChanged: (String? value) {
                  setState(() {
                    _selectedPaymentMethod = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('PayPal'),
              leading: Radio<String>(
                value: 'PayPal',
                groupValue: _selectedPaymentMethod,
                onChanged: (String? value) {
                  setState(() {
                    _selectedPaymentMethod = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Card'),
              leading: Radio<String>(
                value: 'Card',
                groupValue: _selectedPaymentMethod,
                onChanged: (String? value) {
                  setState(() {
                    _selectedPaymentMethod = value!;
                  });
                },
              ),
            ),
            if (_selectedPaymentMethod == 'Card') ...[
              SizedBox(height: 16),
              TextField(
                controller: _cardNumberController,
                keyboardType: TextInputType.number,
                maxLength: 16,
                decoration: InputDecoration(
                  labelText: 'Card Number',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: _submitPayment,
                child: Text('Submit Payment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
