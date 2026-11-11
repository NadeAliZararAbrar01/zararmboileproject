
import 'package:flutter/material.dart';

// Favorites ko store aur manage karne wali class
class FavoriteAzkarStore extends ChangeNotifier {

  // Singleton instance
  static final FavoriteAzkarStore instance =
  FavoriteAzkarStore._();

  // Private constructor
  FavoriteAzkarStore._();

  // Favorite Azkar ki keys store hongi
  final Set<String> _favoriteKeys = {};

  // Check karega ke Azkar favorite hai ya nahi
  bool isFavorite(String key) {
    return _favoriteKeys.contains(key);
  }

  // Favorite add ya remove karega
  void toggleFavorite(String key) {
    if (_favoriteKeys.contains(key)) {
      _favoriteKeys.remove(key);
    } else {
      _favoriteKeys.add(key);
    }

    // UI update karega
    notifyListeners();
  }

  // Favorite keys access karne ke liye
  Set<String> get favoriteKeys => _favoriteKeys;
}
