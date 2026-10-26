import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/app_state.dart';
import '../theme/app_theme.dart';
import '../screens/bookings_screen.dart';
import '../screens/payment_methods_screen.dart';
import '../screens/settings_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<AppState>().userProfile;
    return Drawer(
      backgroundColor: AppColors.surface,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(radius: 26, backgroundColor: AppColors.accent, child: Icon(Icons.person, color: Colors.white)),
                  const SizedBox(height: 10),
                  Text(profile.name.isEmpty ? 'Guest' : profile.name, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                  Text(profile.phone.isEmpty ? '' : profile.phone, style: const TextStyle(fontSize: 11.5, color: AppColors.inkSoft)),
                ],
              ),
            ),
            const Divider(height: 1, color: AppColors.border),
            _tile(context, Icons.home, 'Home', () => Navigator.of(context).popUntil((r) => r.isFirst)),
            _tile(context, Icons.list_alt, 'My Bookings', () => _push(context, const BookingsScreen())),
            _tile(context, Icons.credit_card, 'Payment Methods', () => _push(context, const PaymentMethodsScreen())),
            _tile(context, Icons.settings, 'Settings', () => _push(context, const SettingsScreen())),
            _tile(context, Icons.help_outline, 'Help & Support', () => Navigator.pop(context)),
            const Spacer(),
            _tile(context, Icons.logout, 'Log out', () => Navigator.pop(context), color: AppColors.danger),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  void _push(BuildContext context, Widget screen) {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  Widget _tile(BuildContext context, IconData icon, String label, VoidCallback onTap, {Color? color}) {
    return ListTile(
      leading: Icon(icon, color: color ?? AppColors.ink, size: 20),
      title: Text(label, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.5, color: color ?? AppColors.ink)),
      onTap: onTap,
    );
  }
}
