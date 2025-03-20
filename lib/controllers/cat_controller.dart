import 'package:flutter/material.dart';
import '../models/cat.dart';
import '../services/cat_service.dart';

class CatController with ChangeNotifier {
  final CatService _catService;
  final List<Cat> _cats = [];
  int _likesCount = 0;
  bool _isLoading = false;
  bool _hasError = false;

  List<Cat> get cats => _cats;
  int get likesCount => _likesCount;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;

  CatController({CatService? service}) : _catService = service ?? CatService();

  Future<void> initialize() async {
    if (_isLoading) return;
    _setLoading(true);
    try {
      await _loadInitialCats();
    } catch (_) {
      _setError(true);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> _loadInitialCats() async {
    try {
      final cat = await _catService.fetchRandomCat();
      if (cat != null) {
        _cats.add(cat);
        notifyListeners();
      }
    } catch (_) {
      _setError(true);
    }
  }

  Future<void> _fillBuffer() async {
    while (_cats.length < 5 && !_hasError) {
      try {
        final cat = await _catService.fetchRandomCat();
        if (cat != null) {
          _cats.add(cat);
          notifyListeners();
        }
      } catch (_) {
        _setError(true);
        break;
      }
    }
  }

  void handleSwipe(bool isLiked) {
    if (_cats.isEmpty) return;
    if (isLiked) _likesCount++;
    _cats.removeAt(0);
    notifyListeners();
    if (_cats.length <= 2) _fillBuffer();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(bool value) {
    _hasError = value;
    notifyListeners();
  }

  void reset() {
    _cats.clear();
    _likesCount = 0;
    _hasError = false;
    notifyListeners();
    initialize();
  }
}
