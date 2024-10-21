import 'package:flutter/material.dart';
import 'package:tickleapp/drinks_screen/americano.dart';
import 'package:tickleapp/drinks_screen/caramel.dart';
import 'package:tickleapp/drinks_screen/latte.dart';
import 'package:tickleapp/drinks_screen/mocha.dart';
import 'package:tickleapp/drinks_screen/wmocha.dart';
import 'package:tickleapp/food_screen/pasta_screen/carbonara.dart';
import 'package:tickleapp/food_screen/pasta_screen/lasagna.dart';
import 'package:tickleapp/food_screen/pasta_screen/macaroni.dart';
import 'package:tickleapp/food_screen/pasta_screen/ravioli.dart';
import 'package:tickleapp/food_screen/pastry_screen/applepie.dart';
import 'package:tickleapp/food_screen/pastry_screen/chocolat.dart';
import 'package:tickleapp/food_screen/pastry_screen/cinnamon.dart';
import 'package:tickleapp/food_screen/pastry_screen/cookies.dart';
import 'package:tickleapp/noncoffee_screen/chai.dart';
import 'package:tickleapp/noncoffee_screen/earlgrey.dart';
import 'package:tickleapp/noncoffee_screen/hibiscus.dart';
import 'package:tickleapp/noncoffee_screen/lemonpeach.dart';
import 'package:tickleapp/noncoffee_screen/matcha.dart';
import 'package:tickleapp/food_screen/pastry_screen/croissant.dart';
import 'package:tickleapp/food_screen/pasta_screen/spaghetti.dart';


class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<String> _allItems = [
    'Mocha', 'Americano', 'Caramel', 'White Mocha', 'Cafe Latte',
    'Matcha', 'Chai', 'Earl Grey Tea', 'Hibiscus Tea', 'Lemon Peach Tea',
    'Croissant', 'Apple Pie', 'Pan eu Chocolat', 'Cinnamon Roll', 'Cookies',
    'Spaghetti Bolognese', 'Lasagna', 'Macaroni and Cheese', 'Ravioli', 'Carbonara',
  ];

  List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = _allItems;
  }

  void _filterItems(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredItems = _allItems;
      });
    } else {
      setState(() {
        _filteredItems = _allItems
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  void _navigateToItemScreen(String itemName) {
    Widget screen;

    switch (itemName.toLowerCase()) {
      case 'mocha':
        screen = MochaScreen();
        break;
      case 'americano':
        screen = AmericanoScreen();
        break;
      case 'caramel':
        screen = CaramelScreen();
        break;
      case 'white mocha':
        screen = WhiteMochaScreen();
        break;
      case 'cafe latte':
        screen = LatteScreen();
        break;
      case 'matcha':
        screen = MatchaScreen();
        break;
      case 'chai':
        screen = ChaiScreen();
        break;
      case 'earl grey tea':
        screen = EarlgreyScreen();
        break;
      case 'hibiscus tea':
        screen = HibiscusScreen();
        break;
      case 'lemon peach tea':
        screen = LemonpeachScreen();
        break;
      case 'croissant':
        screen = CroissantScreen();
        break;
      case 'apple pie':
        screen = ApplepieScreen();
        break;
      case 'pan eu chocolat':
        screen = ChocolatScreen();
        break;
      case 'cinnamon roll':
        screen = CinnamonScreen();
        break;
      case 'cookies':
        screen = CookiesScreen();
        break;
      case 'spaghetti bolognese':
        screen = SpaghettiScreen();
        break;
      case 'lasagna':

        screen = LasagnaScreen();
        break;
      case 'macaroni and cheese':
        screen = MacaroniScreen();
        break;
      case 'ravioli':
        screen = RavioliScreen();
        break;
      case 'carbonara':
        screen = CarbonaraScreen();
        break;
      default:
        return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF112e12),
        toolbarHeight: 100,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: TextField(
          controller: _searchController,
          onChanged: _filterItems,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Search for items...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            prefixIcon: Icon(Icons.search, color: Colors.grey),
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: _filteredItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_filteredItems[index]),
            onTap: () {
              _navigateToItemScreen(_filteredItems[index]);
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey,
            thickness: 1,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

