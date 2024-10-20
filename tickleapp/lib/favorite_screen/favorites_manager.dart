import 'package:cloud_firestore/cloud_firestore.dart';

class FavoritesManager {
  static final FavoritesManager _instance = FavoritesManager._internal();
  factory FavoritesManager() => _instance;

  FavoritesManager._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<String>> getFavorites(String userId) async {
    final doc = await _firestore.collection('Users').doc(userId).get();
    return doc.exists ? List<String>.from(doc.data()?['favorites'] ?? []) : [];
  }

  Future<void> addFavorite(String userId, String item) async {
    final docRef = _firestore.collection('Users').doc(userId);
    await docRef.set({
      'favorites': FieldValue.arrayUnion([item])
    }, SetOptions(merge: true));
  }

  Future<void> removeFavorite(String userId, String item) async {
    final docRef = _firestore.collection('Users').doc(userId);
    await docRef.set({
      'favorites': FieldValue.arrayRemove([item])
    }, SetOptions(merge: true));
  }
}
