import 'package:shared_preferences/shared_preferences.dart';

class FavoritesManager {
  static final FavoritesManager _instance = FavoritesManager._internal();
  factory FavoritesManager() => _instance;

  FavoritesManager._internal();

  Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('favorites') ?? [];
  }

  Future<void> addFavorite(String item) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = await getFavorites();
    if (!favorites.contains(item)) {
      favorites.add(item);
      await prefs.setStringList('favorites', favorites);
    }
  }

  Future<void> removeFavorite(String item) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = await getFavorites();
    favorites.remove(item);
    await prefs.setStringList('favorites', favorites);
  }
}
