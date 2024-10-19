import 'package:flutter/material.dart';
import 'favorites_manager.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  Future<List<String>>? _favoritesFuture;

  @override
  void initState() {
    super.initState();
    _favoritesFuture = FavoritesManager().getFavorites(); // Initialize the favorites
  }

  Future<void> _refreshFavorites() async {
    setState(() {
      _favoritesFuture = FavoritesManager().getFavorites(); // Refresh the future
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        backgroundColor: Color(0xFF112e12),
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
              return ListTile(
                title: Text(favorites[index]),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle),
                  onPressed: () async {
                    await FavoritesManager().removeFavorite(favorites[index]);
                    _refreshFavorites(); // Refresh the UI after removing
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}