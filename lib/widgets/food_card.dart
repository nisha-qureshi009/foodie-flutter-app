import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/food.dart';
import '../providers/cart_provider.dart';
import '../providers/favorites_provider.dart';
import '../screens/food_detail_screen.dart';

class FoodCard extends StatelessWidget {
  final Food food;
  const FoodCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    final favorite = context.watch<FavoritesProvider>().contains(food.id);
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FoodDetailScreen(food: food))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
              child: Image.network(food.imageUrl, height: 142, width: double.infinity, fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(height: 142, color: const Color(0xFFF1E9E2), child: const Icon(Icons.restaurant, size: 42, color: Colors.grey))),
            ),
            Positioned(right: 10, top: 10, child: InkWell(
              onTap: () => context.read<FavoritesProvider>().toggle(food.id),
              child: CircleAvatar(radius: 17, backgroundColor: Colors.white,
                child: Icon(favorite ? Icons.favorite : Icons.favorite_border, size: 19, color: favorite ? Colors.red : Colors.black87)),
            )),
            if (food.isPopular) Positioned(left: 10, top: 10, child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
              decoration: BoxDecoration(color: const Color(0xFFFF6B35), borderRadius: BorderRadius.circular(20)),
              child: const Text('POPULAR', style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
            )),
          ]),
          Padding(padding: const EdgeInsets.fromLTRB(12, 10, 12, 12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(food.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
            const SizedBox(height: 3),
            Text(food.restaurant, style: TextStyle(color: Colors.grey.shade600, fontSize: 11)),
            const SizedBox(height: 8),
            Row(children: [
              const Icon(Icons.star, size: 14, color: Color(0xFFFFB323)),
              Text(' ${food.rating}', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
              const Spacer(),
              Text('Rs ${food.price.toStringAsFixed(0)}', style: const TextStyle(color: Color(0xFFFF6B35), fontWeight: FontWeight.w700, fontSize: 13)),
            ]),
            const SizedBox(height: 9),
            SizedBox(width: double.infinity, height: 34, child: FilledButton(
              style: FilledButton.styleFrom(backgroundColor: const Color(0xFFFF6B35), padding: EdgeInsets.zero),
              onPressed: () { context.read<CartProvider>().add(food); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${food.name} added to cart'), duration: const Duration(seconds: 1))); },
              child: const Text('Add to cart', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
            )),
          ])),
        ]),
      ),
    );
  }
}
