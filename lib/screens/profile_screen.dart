import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override Widget build(BuildContext context) => SafeArea(child: ListView(padding: const EdgeInsets.all(22), children: [
    const Text('My profile', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
    const SizedBox(height: 22),
    Container(padding: const EdgeInsets.all(18), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(22)), child: const Row(children: [
      CircleAvatar(radius: 31, backgroundColor: Color(0xFFFFE2D7), child: Icon(Icons.person, size: 34, color: Color(0xFFFF6B35))),
      SizedBox(width: 13), Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Foodie Guest', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
        Text('Welcome to Foodie', style: TextStyle(color: Colors.grey, fontSize: 11)),
      ]),
    ])),
    const SizedBox(height: 22),
    _ProfileTile(icon: Icons.receipt_long_outlined, title: 'My orders', subtitle: 'Your order history', onTap: () => _showInfo(context, 'Order history', 'Orders are stored locally in this demo version.')),
    _ProfileTile(icon: Icons.location_on_outlined, title: 'Delivery addresses', subtitle: 'Manage your saved addresses', onTap: () => _showInfo(context, 'Addresses', 'Address management can be connected to your backend.')),
    _ProfileTile(icon: Icons.payment_outlined, title: 'Payment methods', subtitle: 'Manage payment options', onTap: () => _showInfo(context, 'Payments', 'Online payment is not enabled in this demo.')),
    _ProfileTile(icon: Icons.help_outline, title: 'Help & support', subtitle: 'We are here to help', onTap: () => _showInfo(context, 'Support', 'Add your support email or contact details here.')),
    _ProfileTile(icon: Icons.info_outline, title: 'About Foodie', subtitle: 'Version 1.0.0', onTap: () => _showInfo(context, 'About Foodie', 'A Flutter food delivery portfolio project.')),
  ]));
  static void _showInfo(BuildContext context, String title, String message) => showDialog(context: context, builder: (_) => AlertDialog(title: Text(title), content: Text(message), actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))]));
}
class _ProfileTile extends StatelessWidget {
  final IconData icon; final String title; final String subtitle; final VoidCallback onTap;
  const _ProfileTile({required this.icon, required this.title, required this.subtitle, required this.onTap});
  @override Widget build(BuildContext context) => ListTile(
    contentPadding: const EdgeInsets.symmetric(vertical: 5),
    leading: Container(width: 42, height: 42, decoration: BoxDecoration(color: const Color(0xFFFFE2D7), borderRadius: BorderRadius.circular(13)), child: Icon(icon, color: const Color(0xFFFF6B35))),
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
    subtitle: Text(subtitle, style: const TextStyle(fontSize: 10)),
    trailing: const Icon(Icons.chevron_right, color: Colors.grey), onTap: onTap,
  );
}
