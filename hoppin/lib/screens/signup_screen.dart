import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/app_state.dart';
import '../theme/app_theme.dart';
import 'home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  String locationStatus = '';
  Color locationStatusColor = AppColors.inkSoft;

  Future<void> _requestLocation() async {
    final allow = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        title: const Text('📍', style: TextStyle(fontSize: 30)),
        content: const Text("Allow Hoppin to access this device's location? This lets us show you nearby workers and share your location live during a booking.", textAlign: TextAlign.center),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          OutlinedButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Deny')),
          ElevatedButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Allow')),
        ],
      ),
    );

    if (allow == true) {
      setState(() {
        addressCtrl.text = 'Detected: Near Mangalagiri, Andhra Pradesh';
        locationStatus = '✅ Location access granted';
        locationStatusColor = AppColors.success;
      });
      context.read<AppState>().userProfile.locationGranted = true;
    } else {
      setState(() {
        locationStatus = "⚠️ Location denied — you can still enter your address manually, but live tracking and nearby search won't work as well.";
        locationStatusColor = AppColors.accentDark;
      });
    }
  }

  void _continue() {
    if (nameCtrl.text.trim().isEmpty || phoneCtrl.text.trim().isEmpty || addressCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fill in your name, phone number, and address to continue.')));
      return;
    }
    final profile = context.read<AppState>().userProfile;
    profile.name = nameCtrl.text.trim();
    profile.phone = phoneCtrl.text.trim();
    profile.address = addressCtrl.text.trim();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tell us about you')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 8, 18, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('We need a few details before you can book a worker.', style: TextStyle(fontSize: 12.5, color: AppColors.inkSoft)),
            const SizedBox(height: 16),
            _label('Full name'),
            TextField(controller: nameCtrl, decoration: const InputDecoration(hintText: 'e.g. Jahnavi Reddy')),
            const SizedBox(height: 14),
            _label('Phone number'),
            TextField(controller: phoneCtrl, keyboardType: TextInputType.phone, decoration: const InputDecoration(hintText: '+91 ')),
            const SizedBox(height: 14),
            _label('Address'),
            TextField(controller: addressCtrl, maxLines: 2, decoration: const InputDecoration(hintText: 'House no, street, area')),
            const SizedBox(height: 10),
            OutlinedButton.icon(onPressed: _requestLocation, icon: const Icon(Icons.my_location, size: 18), label: const Text('Use my current location')),
            if (locationStatus.isNotEmpty) ...[const SizedBox(height: 6), Text(locationStatus, style: TextStyle(fontSize: 11, color: locationStatusColor))],
            const SizedBox(height: 26),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: _continue, child: const Text('Continue'))),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(text.toUpperCase(), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.inkSoft, letterSpacing: 0.5)),
      );
}
