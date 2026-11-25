import 'package:flutter/material.dart';
import 'main_shell.dart';

class OrderSuccessScreen extends StatelessWidget {
  final String orderId;
  const OrderSuccessScreen({super.key, required this.orderId});
  @override Widget build(BuildContext context) => Scaffold(
    body: Center(child: Padding(padding: const EdgeInsets.all(28), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(width: 112, height: 112, decoration: const BoxDecoration(color: Color(0xFFFFE2D7), shape: BoxShape.circle), child: const Icon(Icons.check_circle, size: 75, color: Color(0xFFFF6B35))),
      const SizedBox(height: 25),
      const Text('Order placed!', style: TextStyle(fontSize: 27, fontWeight: FontWeight.w800)),
      const SizedBox(height: 8),
      Text('Your order has been received. Get ready for something delicious!', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey.shade600, height: 1.5)),
      const SizedBox(height: 20),
      Container(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)), child: Column(children: [
        const Text('ORDER REFERENCE', style: TextStyle(fontSize: 9, color: Colors.grey, letterSpacing: 1)),
        const SizedBox(height: 4), Text(orderId, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
      ])),
      const SizedBox(height: 25),
      SizedBox(width: double.infinity, child: FilledButton(
        style: FilledButton.styleFrom(backgroundColor: const Color(0xFFFF6B35), padding: const EdgeInsets.symmetric(vertical: 15)),
        onPressed: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const MainShell()), (_) => false),
        child: const Text('Back to home'),
      )),
    ]))),
  );
}
