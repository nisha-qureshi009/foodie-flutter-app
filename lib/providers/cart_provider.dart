import 'package:flutter/foundation.dart';
import '../models/food.dart';

class CartLine {
  final Food food;
  int quantity;
  CartLine({required this.food, this.quantity = 1});
  double get total => food.price * quantity;
}

class CartProvider extends ChangeNotifier {
  final Map<String, CartLine> _items = {};
  List<CartLine> get items => _items.values.toList();
  int get itemCount => _items.values.fold(0, (sum, line) => sum + line.quantity);
  double get subtotal => _items.values.fold(0, (sum, line) => sum + line.total);
  double get deliveryFee => _items.isEmpty ? 0 : 150;
  double get tax => subtotal * 0.05;
  double get total => subtotal + deliveryFee + tax;

  void add(Food food) {
    if (_items.containsKey(food.id)) {
      _items[food.id]!.quantity++;
    } else {
      _items[food.id] = CartLine(food: food);
    }
    notifyListeners();
  }

  void decrease(String id) {
    final line = _items[id];
    if (line == null) return;
    if (line.quantity > 1) {
      line.quantity--;
    } else {
      _items.remove(id);
    }
    notifyListeners();
  }

  void remove(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
