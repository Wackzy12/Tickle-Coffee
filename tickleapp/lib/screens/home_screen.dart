import 'package:flutter/material.dart';
import 'package:tickleapp/food_screen/pasta_screen/spaghetti.dart';
import 'package:tickleapp/food_screen/pastry_screen/croissant.dart';
import 'package:tickleapp/noncoffee_screen/matcha.dart';
import '../drinks_screen/mocha.dart';
import '../cart_screen/cart_screen.dart';

// Model for Menu Items
class MenuItemModel {
  final String name;
  final String imagePath;

  MenuItemModel({required this.name, required this.imagePath});
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<HomeScreen> {
  List<MenuItemModel> favorites = []; // List to hold favorite items

  // List of all items (you can modify this as needed)
  final List<MenuItemModel> menuItems = [
    MenuItemModel(name: 'Mocha', imagePath: 'assets/mocha.jpg'),
    MenuItemModel(name: 'Matcha', imagePath: 'assets/matcha.jpg'),
    MenuItemModel(name: 'Croissant', imagePath: 'assets/croissant.jpg'),
    MenuItemModel(name: 'Spaghetti', imagePath: 'assets/spaghetti.jpg'),
  ];

  // Function to toggle favorites
  void toggleFavorite(MenuItemModel item) {
    setState(() {
      if (favorites.contains(item)) {
        favorites.remove(item);
      } else {
        favorites.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF112e12),
        toolbarHeight: 110,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: 'Search Here',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
              },
              child: Icon(Icons.shopping_cart, color: Colors.white),
            ),
            SizedBox(width: 16),
            Icon(Icons.favorite, color: Colors.white),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Balance Container
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 60, horizontal: 120),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [Colors.green, Color(0xFF112e12)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '\$5,500.50',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Balance',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Popular Menu Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular in the menu',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.arrow_forward_sharp, color: Color(0xFF112e12)),
                  ],
                ),
                SizedBox(height: 16),
                // Horizontal list of popular menu items
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: menuItems.map((item) {
                      return MenuItem(
                        imagePath: item.imagePath,
                        item: item,
                        onFavoriteToggle: toggleFavorite,
                        isFavorite: favorites.contains(item),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 20),
                // Special Offers Section
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.green.shade700,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'SPECIAL OFFERS',
                      style: TextStyle(
                        fontFamily: 'Howdy',
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage('assets/offers.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String imagePath;
  final MenuItemModel item;
  final Function(MenuItemModel) onFavoriteToggle;
  final bool isFavorite;

  const MenuItem({
    Key? key,
    required this.imagePath,
    required this.item,
    required this.onFavoriteToggle,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the item's screen (if you have one)
        // You can replace this with the actual screen for the item
        // Navigator.push(context, MaterialPageRoute(builder: (context) => YourItemScreen(item)));
      },
      child: Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 5,
              right: 5,
              child: GestureDetector(
                onTap: () => onFavoriteToggle(item),
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}