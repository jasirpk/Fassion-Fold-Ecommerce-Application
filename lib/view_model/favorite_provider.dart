import 'package:flutter/cupertino.dart';

class FavoriteProvider with ChangeNotifier {
  Map<int, bool> _favorites = {};
  Map<int, bool> get favorites => _favorites;
  void toggleFavorite(int index) {
    if (_favorites.containsKey(index)) {
      _favorites[index] = !_favorites[index]!;
    } else {
      _favorites[index] = true;
    }
    notifyListeners();
  }

  bool isFavorite(int index) {
    return _favorites[index] ?? false;
  }
}
