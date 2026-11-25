import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import 'checkout_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    return SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(20, 20, 20, 12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('My Cart', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
      const SizedBox(height: 5),
      Text('${cart.itemCount} items in your bag', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
      const SizedBox(height: 18),
      if (cart.items.isEmpty) const Expanded(child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(Icons.shopping_bag_outlined, size: 70, color: Color(0xFFFFB49A)),
        SizedBox(height: 12), Text('Your cart is empty', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17)),
        SizedBox(height: 5), Text('Add something delicious to get started.', style: TextStyle(color: Colors.grey, fontSize: 12)),
      ])))
      else ...[
        Expanded(child: ListView.separated(itemCount: cart.items.length, separatorBuilder: (_, __) => const SizedBox(height: 12), itemBuilder: (_, i) {
          final line = cart.items[i];
          return Container(padding: const EdgeInsets.all(11), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)), child: Row(children: [
            ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.network(line.food.imageUrl, width: 76, height: 76, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(width: 76, height: 76, color: Colors.orange.shade50, child: const Icon(Icons.fastfood)))),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(line.food.name, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
              Text('Rs ${line.food.price.toStringAsFixed(0)}', style: const TextStyle(color: Color(0xFFFF6B35), fontWeight: FontWeight.w700, fontSize: 12)),
              const SizedBox(height: 8),
              Row(children: [
                _QtyButton(icon: Icons.remove, onTap: () => context.read<CartProvider>().decrease(line.food.id)),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 12), child: Text('${line.quantity}', style: const TextStyle(fontWeight: FontWeight.w700))),
                _QtyButton(icon: Icons.add, onTap: () => context.read<CartProvider>().add(line.food)),
              ]),
            ])),
            IconButton(onPressed: () => context.read<CartProvider>().remove(line.food.id), icon: const Icon(Icons.delete_outline, color: Colors.grey)),
          ]));
        })),
        Container(padding: const EdgeInsets.all(17), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)), child: Column(children: [
          _PriceRow(label: 'Subtotal', value: cart.subtotal),
          const SizedBox(height: 8), _PriceRow(label: 'Delivery fee', value: cart.deliveryFee),
          const SizedBox(height: 8), _PriceRow(label: 'Tax (5%)', value: cart.tax),
          const Divider(height: 22),
          _PriceRow(label: 'Total', value: cart.total, bold: true),
          const SizedBox(height: 14),
          SizedBox(width: double.infinity, child: FilledButton(
            style: FilledButton.styleFrom(backgroundColor: const Color(0xFFFF6B35), padding: const EdgeInsets.symmetric(vertical: 15)),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CheckoutScreen())),
            child: const Text('Proceed to checkout'),
          )),
        ])),
      ],
    ])));
  }
}
class _QtyButton extends StatelessWidget {
  final IconData icon; final VoidCallback onTap;
  const _QtyButton({required this.icon, required this.onTap});
  @override Widget build(BuildContext context) => InkWell(onTap: onTap, child: Container(width: 25, height: 25, decoration: BoxDecoration(color: const Color(0xFFFFE2D7), borderRadius: BorderRadius.circular(8)), child: Icon(icon, size: 15, color: const Color(0xFFFF6B35))));
}
class _PriceRow extends StatelessWidget {
  final String label; final double value; final bool bold;
  const _PriceRow({required this.label, required this.value, this.bold = false});
  @override Widget build(BuildContext context) => Row(children: [
    Expanded(child: Text(label, style: TextStyle(fontSize: 12, fontWeight: bold ? FontWeight.w800 : FontWeight.normal))),
    Text('Rs ${value.toStringAsFixed(0)}', style: TextStyle(fontSize: bold ? 16 : 12, fontWeight: bold ? FontWeight.w800 : FontWeight.w600, color: bold ? const Color(0xFFFF6B35) : Colors.black87)),
  ]);
}
