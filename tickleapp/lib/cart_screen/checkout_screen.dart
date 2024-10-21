import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tickleapp/navigator.dart';
import 'cart_manager.dart';

class CheckoutScreen extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  final double totalPrice;

  CheckoutScreen({required this.cartItems, required this.totalPrice});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String? selectedPaymentMethod;
  final List<String> paymentMethods = ['Tickle Credits', 'Gcash', 'PayPal', 'Credit Card'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Checkout',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              'Ordered Items:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // List of ordered items
            ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                final item = widget.cartItems[index];
                return ListTile(
                  title: Text('${item['name']} (${item['size']})'),
                  subtitle: Text('${item['type']} - ₱${item['price']} x ${item['quantity']}'),
                );
              },
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            ),

            SizedBox(height: 20),


            Text(
              'Total: ₱${widget.totalPrice}', // Use passed total price
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),


            Text(
              'Select Payment Method:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Set the background color to white
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(color: Color(0xFF112e12)),
              ),
              child: DropdownButton<String>(
                value: selectedPaymentMethod,
                hint: Text('Choose a payment method'),
                dropdownColor: Colors.white,
                items: paymentMethods.map((String method) {
                  return DropdownMenuItem<String>(
                    value: method,
                    child: Text(method),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedPaymentMethod = newValue;
                  });
                },
              ),
            ),

            SizedBox(height: 20),


            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () async {
                  if (selectedPaymentMethod == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select a payment method!')),
                    );
                    return;
                  }


                  User? currentUser = FirebaseAuth.instance.currentUser;


                  FirebaseFirestore firestore = FirebaseFirestore.instance;

                  if (currentUser != null) {
                    try {
                      if (selectedPaymentMethod == 'Tickle Credits') {
                        DocumentSnapshot userDoc = await firestore.collection('Users').doc(currentUser.uid).get();
                        double userCredits = userDoc['credits'] ?? 0;

                        if (userCredits < widget.totalPrice) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Insufficient credits!')),
                          );
                          return;
                        }

                        // Update user's credits
                        await firestore.collection('Users').doc(currentUser.uid).set({
                          'credits': FieldValue.increment(-widget.totalPrice),
                        }, SetOptions(merge: true));
                      }

                      // Save order to Firestore
                      await firestore.collection('Orders').add({
                        'userId': currentUser.uid,
                        'items': widget.cartItems,
                        'totalPrice': widget.totalPrice,
                        'orderDate': DateTime.now(),
                        'paymentMethod': selectedPaymentMethod,
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Order placed successfully!')),
                      );

                      CartManager.instance.cartItems.clear();




                      Navigator.push(context, MaterialPageRoute(builder: (context) => MainNavigator()));
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to place order: $e')),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('No user logged in!')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF112e12),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text(
                  'Place Order',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}