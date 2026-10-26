import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/app_state.dart';
import '../data/mock_data.dart';
import '../theme/app_theme.dart';
import 'success_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int selectedPayment = 0;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final vendor = state.currentVendor!;
    final booking = state.currentBooking!;

    final base = booking.chargeableAmount;
    const platformFee = 15.0;
    final tax = (base * 0.06).roundToDouble();
    final total = base + platformFee + tax;

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Column(children: [
        Container(
          margin: const EdgeInsets.fromLTRB(18, 12, 18, 6), padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(color: const Color(0xFFFFF4E0), borderRadius: BorderRadius.circular(10)),
          child: const Center(child: Text('⚠️ Sandbox mode — no real payment is processed', style: TextStyle(color: AppColors.accentDark, fontSize: 11, fontWeight: FontWeight.w700))),
        ),
        Expanded(
          child: ListView(padding: const EdgeInsets.symmetric(horizontal: 18), children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Text('ORDER SUMMARY', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.inkSoft))),
            _sumRow('${categoryById(vendor.categoryId).label} — ${vendor.name}', base),
            _sumRow('Platform fee', platformFee),
            _sumRow('Taxes', tax),
            const Divider(),
            _sumRow('Total', total, bold: true),
            const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Text('CHOOSE PAYMENT METHOD', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.inkSoft))),
            ...List.generate(paymentMethods.length, (i) {
              final p = paymentMethods[i];
              final selected = selectedPayment == i;
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: () => setState(() => selectedPayment = i),
                  child: Container(
                    padding: const EdgeInsets.all(13),
                    decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(14), border: Border.all(color: selected ? AppColors.primary : AppColors.border, width: selected ? 1.5 : 1)),
                    child: Row(children: [
                      Container(width: 36, height: 36, decoration: BoxDecoration(color: const Color(0xFFEEF2EA), borderRadius: BorderRadius.circular(10)), child: Icon(p.icon, size: 18, color: AppColors.primary)),
                      const SizedBox(width: 12),
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(p.name, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                        Text(p.subtitle, style: const TextStyle(fontSize: 11, color: AppColors.inkSoft)),
                      ])),
                      Radio<int>(value: i, groupValue: selectedPayment, onChanged: (v) => setState(() => selectedPayment = v!)),
                    ]),
                  ),
                ),
              );
            }),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(18),
          child: SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {
            context.read<AppState>().completePayment(paymentMethods[selectedPayment].name, total);
            Navigator.push(context, MaterialPageRoute(builder: (_) => const SuccessScreen()));
          }, child: Text('Pay ₹${total.toStringAsFixed(0)}'))),
        ),
      ]),
    );
  }

  Widget _sumRow(String label, double amount, {bool bold = false}) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(label, style: TextStyle(fontSize: bold ? 15 : 13, fontWeight: bold ? FontWeight.w800 : FontWeight.w400)),
          Text('₹${amount.toStringAsFixed(0)}', style: TextStyle(fontSize: bold ? 15 : 13, fontWeight: bold ? FontWeight.w800 : FontWeight.w400)),
        ]),
      );
}
