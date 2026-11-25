import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import 'order_success_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});
  @override State<CheckoutScreen> createState() => _CheckoutScreenState();
}
class _CheckoutScreenState extends State<CheckoutScreen> {
  final name = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();
  String payment = 'Cash on Delivery';
  @override void dispose() { name.dispose(); phone.dispose(); address.dispose(); super.dispose(); }

  @override Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout', style: TextStyle(fontWeight: FontWeight.w800))),
      body: ListView(padding: const EdgeInsets.all(20), children: [
        const Text('Delivery details', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
        const SizedBox(height: 14),
        TextField(controller: name, decoration: const InputDecoration(labelText: 'Full name', prefixIcon: Icon(Icons.person_outline))),
        const SizedBox(height: 12),
        TextField(controller: phone, keyboardType: TextInputType.phone, decoration: const InputDecoration(labelText: 'Phone number', prefixIcon: Icon(Icons.phone_outlined))),
        const SizedBox(height: 12),
        TextField(controller: address, maxLines: 3, decoration: const InputDecoration(labelText: 'Complete delivery address', alignLabelWithHint: true, prefixIcon: Icon(Icons.location_on_outlined))),
        const SizedBox(height: 24),
        const Text('Payment method', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
        const SizedBox(height: 10),
        ...['Cash on Delivery', 'Card (demo only)'].map((method) => RadioListTile<String>(
          value: method, groupValue: payment, activeColor: const Color(0xFFFF6B35),
          onChanged: (value) => setState(() => payment = value!), title: Text(method, style: const TextStyle(fontSize: 13)),
          contentPadding: EdgeInsets.zero,
        )),
        const SizedBox(height: 15),
        Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)), child: Row(children: [
          const Expanded(child: Text('Order total', style: TextStyle(fontWeight: FontWeight.w700))),
          Text('Rs ${cart.total.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.w800, color: Color(0xFFFF6B35), fontSize: 18)),
        ])),
        const SizedBox(height: 18),
        SizedBox(height: 52, child: FilledButton(
          style: FilledButton.styleFrom(backgroundColor: const Color(0xFFFF6B35)),
          onPressed: () {
            if (name.text.trim().isEmpty || phone.text.trim().isEmpty || address.text.trim().isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please complete all delivery details.')));
              return;
            }
            final orderId = 'FD${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';
            cart.clear();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => OrderSuccessScreen(orderId: orderId)));
          },
          child: const Text('Place order'),
        )),
      ]),
    );
  }
}
