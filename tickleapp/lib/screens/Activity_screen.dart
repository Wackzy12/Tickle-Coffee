import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {

  final List<String> activities = [
    'ORDEREDS',
    'CASH-IN',
    'SEND CREDIT'
  ];

  final List<String> activityDates = [
    "Sep 10, 2024",
    "Sep 11, 2024",
    "Sep 12, 2024"
  ];

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
            'Activity History',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ListTile(
              leading: Icon(Icons.check_circle_rounded),
              title: Text(
                activities[index],
                style: TextStyle(fontSize: 18),
              ),
              subtitle: Text(activityDates[index]),
            ),
          );
        },
      ),
    );
  }
}
