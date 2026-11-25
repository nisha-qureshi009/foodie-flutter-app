import 'package:flutter/material.dart';
import '../data/food_data.dart';
import '../widgets/food_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  String category = 'All';
  String query = '';
  @override
  Widget build(BuildContext context) {
    final visible = foods.where((food) {
      final matchesCategory = category == 'All' || food.category == category;
      final matchesQuery = '${food.name} ${food.restaurant}'.toLowerCase().contains(query.toLowerCase());
      return matchesCategory && matchesQuery;
    }).toList();
    return SafeArea(child: CustomScrollView(slivers: [
      SliverPadding(padding: const EdgeInsets.fromLTRB(20, 14, 20, 0), sliver: SliverToBoxAdapter(child: Row(children: [
        Container(width: 43, height: 43, decoration: BoxDecoration(color: const Color(0xFFFFE2D7), borderRadius: BorderRadius.circular(14)),
          child: const Icon(Icons.delivery_dining, color: Color(0xFFFF6B35), size: 27)),
        const SizedBox(width: 10),
        const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('DELIVER TO', style: TextStyle(fontSize: 9, color: Colors.grey, letterSpacing: 1.2, fontWeight: FontWeight.w700)),
          Row(children: [Text('Hyderabad, Pakistan', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700)), Icon(Icons.keyboard_arrow_down, size: 17)]),
        ])),
        IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none_rounded)),
      ]))),
      SliverPadding(padding: const EdgeInsets.fromLTRB(20, 24, 20, 0), sliver: SliverToBoxAdapter(child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), gradient: const LinearGradient(colors: [Color(0xFFFF784B), Color(0xFFFF542B)])),
        child: Row(children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('TASTY FOOD,', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 22, height: 1.2)),
            const Text('DELIVERED FAST.', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 22, height: 1.2)),
            const SizedBox(height: 8),
            const Text('Your cravings, just a tap away.', style: TextStyle(color: Colors.white, fontSize: 11)),
            const SizedBox(height: 13),
            Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: const Text('ORDER NOW  →', style: TextStyle(color: Color(0xFFFF6B35), fontSize: 10, fontWeight: FontWeight.w800))),
          ])),
          const Icon(Icons.lunch_dining, color: Colors.white, size: 94),
        ]),
      ))),
      SliverPadding(padding: const EdgeInsets.fromLTRB(20, 22, 20, 0), sliver: SliverToBoxAdapter(child: TextField(
        onChanged: (value) => setState(() => query = value),
        decoration: const InputDecoration(hintText: 'Search dishes or restaurants...', prefixIcon: Icon(Icons.search), suffixIcon: Icon(Icons.tune)),
      ))),
      SliverPadding(padding: const EdgeInsets.fromLTRB(20, 22, 20, 12), sliver: SliverToBoxAdapter(child: Row(children: [
        const Expanded(child: Text('Explore categories', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800))),
        Text('${categories.length - 1} categories', style: TextStyle(color: Colors.grey.shade600, fontSize: 10)),
      ]))),
      SliverToBoxAdapter(child: SizedBox(height: 42, child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20), scrollDirection: Axis.horizontal, itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) { final item = categories[i]; final selected = item == category; return ChoiceChip(
          label: Text(item), selected: selected, onSelected: (_) => setState(() => category = item),
          selectedColor: const Color(0xFFFF6B35), backgroundColor: Colors.white,
          labelStyle: TextStyle(color: selected ? Colors.white : Colors.black87, fontSize: 11, fontWeight: FontWeight.w600),
          side: BorderSide.none, showCheckmark: false,
        ); },
      ))),
      SliverPadding(padding: const EdgeInsets.fromLTRB(20, 22, 20, 12), sliver: SliverToBoxAdapter(child: Row(children: [
        const Expanded(child: Text('Popular near you', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800))),
        TextButton(onPressed: () => setState(() => category = 'All'), child: const Text('See all', style: TextStyle(color: Color(0xFFFF6B35), fontSize: 11))),
      ]))),
      if (visible.isEmpty) const SliverFillRemaining(hasScrollBody: false, child: Center(child: Text('No dishes found. Try another search.')))
      else SliverPadding(padding: const EdgeInsets.fromLTRB(20, 0, 20, 24), sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, i) => FoodCard(food: visible[i]), childCount: visible.length),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 13, mainAxisSpacing: 14, childAspectRatio: .70),
      )),
    ]));
  }
}
