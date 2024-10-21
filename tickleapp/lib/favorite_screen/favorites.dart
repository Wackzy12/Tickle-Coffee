import 'package:flutter/material.dart';
import 'favorites_manager.dart';

import '../drinks_screen/mocha.dart';
import '../drinks_screen/wmocha.dart';
import '../drinks_screen/americano.dart';
import '../drinks_screen/latte.dart';
import '../drinks_screen/caramel.dart';

import '../noncoffee_screen/matcha.dart';
import '../noncoffee_screen/earlgrey.dart';
import '../noncoffee_screen/chai.dart';
import '../noncoffee_screen/hibiscus.dart';
import '../noncoffee_screen/lemonpeach.dart';

import '../food_screen/pasta_screen/ravioli.dart';
import '../food_screen/pasta_screen/carbonara.dart';
import '../food_screen/pasta_screen/spaghetti.dart';
import '../food_screen/pasta_screen/macaroni.dart';
import '../food_screen/pasta_screen/lasagna.dart';

import '../food_screen/pastry_screen/croissant.dart';
import '../food_screen/pastry_screen/chocolat.dart';
import '../food_screen/pastry_screen/applepie.dart';
import '../food_screen/pastry_screen/cinnamon.dart';
import '../food_screen/pastry_screen/cookies.dart';

class FavoritesScreen extends StatefulWidget {
  final String userId; // Pass the user ID when initializing the screen

  const FavoritesScreen({Key? key, required this.userId}) : super(key: key);


  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  Future<List<String>>? _favoritesFuture;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() {
    setState(() {
      _favoritesFuture = FavoritesManager().getFavorites(widget.userId);
    });
  }

  Future<void> _refreshFavorites() async {
    _loadFavorites();
  }

  Widget _getFavoriteScreen(String favorite) {
    switch (favorite) {

      case 'Mocha':
        return MochaScreen();
      case 'White Mocha':
        return WhiteMochaScreen();
      case 'Caramel':
        return CaramelScreen();
      case 'Cafe Latte':
        return LatteScreen();
      case 'Americano':
        return AmericanoScreen();

      case 'Matcha Latte':
        return MatchaScreen();
      case 'Earl Grey Tea':
        return EarlgreyScreen();
      case 'Hibiscus Tea':
        return HibiscusScreen();
      case 'Chai':
        return ChaiScreen();
      case 'Lemon Peach Tea':
        return LemonpeachScreen();

      case 'Spaghetti Bolognese':
        return SpaghettiScreen();
      case 'Macaroni And Cheese':
        return MacaroniScreen();
      case 'Lasagna':
        return LasagnaScreen();
      case 'Ravioli':
        return RavioliScreen();
      case 'Carbonara':
        return CarbonaraScreen();

      case 'Apple Pie':
        return ApplepieScreen();
      case 'Cinnamon Roll':
        return CinnamonScreen();
      case 'Croissant':
        return CroissantScreen();
      case 'Pan eu Chocolat':
        return ChocolatScreen();
      case 'Cookies':
        return CookiesScreen();

    // Add more cases here for other items
      default:
        return Scaffold(body: Center(child: Text('Item not found')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Favorites',
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
      body: FutureBuilder<List<String>>(
        future: _favoritesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final favorites = snapshot.data ?? [];
          if (favorites.isEmpty) {
            return Center(child: Text('No favorites yet.'));
          }
          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final favorite = favorites[index];
              return ListTile(
                title: Text(favorite),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle),
                  onPressed: () async {
                    await FavoritesManager().removeFavorite(widget.userId, favorite);
                    _refreshFavorites();
                  },
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => _getFavoriteScreen(favorite),
                    ),
                  ).then((_) {
                    _refreshFavorites();
                  });
                },
              );
            },
          );
        },
      ),
    );
  }
}


