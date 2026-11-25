import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/food.dart';
import '../providers/cart_provider.dart';
import '../providers/favorites_provider.dart';

class FoodDetailScreen extends StatelessWidget {
  final Food food;
  const FoodDetailScreen({super.key, required this.food});
  @override
  Widget build(BuildContext context) {
    final favorite = context.watch<FavoritesProvider>().contains(food.id);
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(expandedHeight: 300, pinned: true, backgroundColor: Colors.white,
          leading: IconButton(onPressed: () => Navigator.pop(context), icon: const CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.arrow_back, color: Colors.black))),
          actions: [IconButton(onPressed: () => context.read<FavoritesProvider>().toggle(food.id), icon: CircleAvatar(backgroundColor: Colors.white, child: Icon(favorite ? Icons.favorite : Icons.favorite_border, color: favorite ? Colors.red : Colors.black)))],
          flexibleSpace: FlexibleSpaceBar(background: Image.network(food.imageUrl, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(color: const Color(0xFFF1E9E2), child: const Icon(Icons.restaurant, size: 80)))),
        ),
        SliverPadding(padding: const EdgeInsets.all(22), sliver: SliverToBoxAdapter(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(food.category.toUpperCase(), style: const TextStyle(color: Color(0xFFFF6B35), fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 1.5)),
          const SizedBox(height: 8),
          Text(food.name, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
          const SizedBox(height: 7),
          Text(food.restaurant, style: TextStyle(color: Colors.grey.shade600)),
          const SizedBox(height: 16),
          Row(children: [
            const Icon(Icons.star, color: Color(0xFFFFB323), size: 18), Text(' ${food.rating}  ', style: const TextStyle(fontWeight: FontWeight.w700)),
            const Icon(Icons.access_time, size: 17, color: Colors.grey), Text(' ${food.deliveryMinutes} min delivery', style: TextStyle(color: Colors.grey.shade700)),
          ]),
          const SizedBox(height: 22),
          const Text('About this dish', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
          const SizedBox(height: 8),
          Text(food.description, style: TextStyle(color: Colors.grey.shade700, height: 1.7)),
          const SizedBox(height: 28),
          Row(children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('TOTAL PRICE', style: TextStyle(color: Colors.grey.shade600, fontSize: 9, letterSpacing: 1)),
              Text('Rs ${food.price.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 23, color: Color(0xFFFF6B35))),
            ])),
            FilledButton.icon(
              style: FilledButton.styleFrom(backgroundColor: const Color(0xFFFF6B35), padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15)),
              onPressed: () { context.read<CartProvider>().add(food); ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Added to your cart'))); },
              icon: const Icon(Icons.add_shopping_cart), label: const Text('Add to cart'),
            ),
          ]),
        ]))),
      ]),
    );
  }
}
