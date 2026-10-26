import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/app_state.dart';
import '../theme/app_theme.dart';

class SavedAddressesScreen extends StatelessWidget {
  const SavedAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<AppState>().userProfile;
    return Scaffold(
      appBar: AppBar(title: const Text('Saved addresses')),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
            decoration: BoxDecoration(color: AppColors.surface, border: Border.all(color: AppColors.border), borderRadius: BorderRadius.circular(14)),
            child: Column(children: [
              ListTile(leading: const Icon(Icons.home, size: 18), title: const Text('Home', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)), subtitle: Text(profile.address.isEmpty ? 'Not added yet' : profile.address, style: const TextStyle(fontSize: 11.5))),
              const Divider(height: 1),
              const ListTile(leading: Icon(Icons.work, size: 18), title: Text('Work', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)), trailing: Text('Not added')),
            ]),
          ),
          const SizedBox(height: 16),
          OutlinedButton(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Add new address form goes here'))), child: const Text('+ Add new address')),
        ]),
      ),
    );
  }
}
