import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/food_data.dart';
import '../providers/favorites_provider.dart';
import '../widgets/food_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});
  @override Widget build(BuildContext context) {
    final ids = context.watch<FavoritesProvider>();
    final saved = foods.where((food) => ids.contains(food.id)).toList();
    return SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(20, 20, 20, 0), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Your favorites', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
      const SizedBox(height: 5),
      Text('All the dishes you have saved', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
      const SizedBox(height: 18),
      if (saved.isEmpty) const Expanded(child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(Icons.favorite_border, size: 68, color: Color(0xFFFFB49A)),
        SizedBox(height: 12), Text('No favorites yet', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17)),
        SizedBox(height: 5), Text('Tap the heart on a dish to save it.', style: TextStyle(color: Colors.grey, fontSize: 12)),
      ])))
      else Expanded(child: GridView.builder(itemCount: saved.length, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 13, mainAxisSpacing: 14, childAspectRatio: .70), itemBuilder: (_, i) => FoodCard(food: saved[i]))),
    ])));
  }
}
