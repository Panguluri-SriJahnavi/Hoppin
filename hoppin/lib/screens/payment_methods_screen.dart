import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../theme/app_theme.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment methods')),
      body: Column(children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(18, 8, 18, 0),
            children: paymentMethods.map((p) => Container(
                  margin: const EdgeInsets.only(bottom: 10), padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(color: AppColors.surface, border: Border.all(color: AppColors.border), borderRadius: BorderRadius.circular(14)),
                  child: Row(children: [
                    Container(width: 36, height: 36, decoration: BoxDecoration(color: const Color(0xFFEEF2EA), borderRadius: BorderRadius.circular(10)), child: Icon(p.icon, size: 18, color: AppColors.primary)),
                    const SizedBox(width: 12),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(p.name, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                      Text(p.subtitle, style: const TextStyle(fontSize: 11, color: AppColors.inkSoft)),
                    ])),
                    const Text('✓ Active', style: TextStyle(fontSize: 11, color: AppColors.inkSoft)),
                  ]),
                )).toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18),
          child: SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Add a new payment method — form goes here')));
          }, child: const Text('+ Add new payment method'))),
        ),
      ]),
    );
  }
}
