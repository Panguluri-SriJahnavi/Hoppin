import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/app_state.dart';
import '../theme/app_theme.dart';
import 'profile_details_screen.dart';
import 'saved_addresses_screen.dart';
import 'language_screen.dart';
import 'payment_methods_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notifications = true;
  bool locationAccess = true;
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final langLabel = {'en': 'English', 'te': 'తెలుగు', 'hi': 'हिंदी'}[state.userProfile.language] ?? 'English';

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        children: [
          const Text('ACCOUNT', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.inkSoft)),
          _group([
            _navRow(context, Icons.person, 'Profile details', const ProfileDetailsScreen()),
            _navRow(context, Icons.location_on, 'Saved addresses', const SavedAddressesScreen()),
            _navRow(context, Icons.credit_card, 'Payment methods', const PaymentMethodsScreen()),
          ]),
          const SizedBox(height: 16),
          const Text('PREFERENCES', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.inkSoft)),
          _group([
            _navRow(context, Icons.language, 'Language', const LanguageScreen(), trailing: langLabel),
            _toggleRow(Icons.notifications, 'Notifications', notifications, (v) => setState(() => notifications = v)),
            _toggleRow(Icons.location_on, 'Location access', locationAccess, (v) => setState(() => locationAccess = v)),
            _toggleRow(Icons.text_fields, 'Larger text', state.userProfile.largerText, (v) { state.userProfile.largerText = v; setState(() {}); }),
            _toggleRow(Icons.dark_mode, 'Dark mode', darkMode, (v) => setState(() => darkMode = v)),
          ]),
          const SizedBox(height: 16),
          const Text('SUPPORT', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.inkSoft)),
          _group([
            _simpleRow(Icons.help_outline, 'Help center'),
            _simpleRow(Icons.lock_outline, 'Privacy & security'),
            _simpleRow(Icons.logout, 'Log out', color: AppColors.danger),
          ]),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _group(List<Widget> rows) => Container(
        margin: const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(color: AppColors.surface, border: Border.all(color: AppColors.border), borderRadius: BorderRadius.circular(14)),
        child: Column(children: rows),
      );

  Widget _navRow(BuildContext context, IconData icon, String label, Widget screen, {String? trailing}) => ListTile(
        leading: Icon(icon, size: 18),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
        trailing: Text('${trailing ?? ''} ›', style: const TextStyle(fontSize: 11.5, color: AppColors.inkSoft)),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => screen)).then((_) => setState(() {})),
      );

  Widget _toggleRow(IconData icon, String label, bool value, ValueChanged<bool> onChanged) => ListTile(
        leading: Icon(icon, size: 18),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
        trailing: Switch(value: value, onChanged: onChanged, activeColor: AppColors.primary),
      );

  Widget _simpleRow(IconData icon, String label, {Color? color}) => ListTile(
        leading: Icon(icon, size: 18, color: color),
        title: Text(label, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: color)),
        trailing: color == null ? const Text('›', style: TextStyle(color: AppColors.inkSoft)) : null,
      );
}
