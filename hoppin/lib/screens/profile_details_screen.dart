import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/app_state.dart';
import '../theme/app_theme.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<AppState>().userProfile;
    return Scaffold(
      appBar: AppBar(title: const Text('Profile details')),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
            decoration: BoxDecoration(color: AppColors.surface, border: Border.all(color: AppColors.border), borderRadius: BorderRadius.circular(14)),
            child: Column(children: [
              ListTile(leading: const Icon(Icons.person, size: 18), title: const Text('Full name', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)), trailing: Text(profile.name.isEmpty ? 'Not added' : profile.name)),
              const Divider(height: 1),
              ListTile(leading: const Icon(Icons.call, size: 18), title: const Text('Phone number', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)), trailing: Text(profile.phone.isEmpty ? 'Not added' : profile.phone)),
              const Divider(height: 1),
              const ListTile(leading: Icon(Icons.email, size: 18), title: Text('Email', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)), trailing: Text('jahnavi@example.com')),
            ]),
          ),
          const SizedBox(height: 16),
          OutlinedButton(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Edit profile form goes here'))), child: const Text('Edit profile')),
        ]),
      ),
    );
  }
}
