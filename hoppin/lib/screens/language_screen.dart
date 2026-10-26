import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/app_state.dart';
import '../theme/app_theme.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});
  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    final profile = context.watch<AppState>().userProfile;
    final options = {'en': 'English', 'te': 'తెలుగు (Telugu)', 'hi': 'हिंदी (Hindi)'};

    return Scaffold(
      appBar: AppBar(title: const Text('Language')),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Container(
          decoration: BoxDecoration(color: AppColors.surface, border: Border.all(color: AppColors.border), borderRadius: BorderRadius.circular(14)),
          child: Column(
            children: options.entries.map((e) {
              final selected = profile.language == e.key;
              return Column(children: [
                ListTile(
                  leading: const Icon(Icons.language, size: 18),
                  title: Text(e.value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                  trailing: selected ? const Icon(Icons.check, color: AppColors.primary) : null,
                  onTap: () => setState(() => profile.language = e.key),
                ),
                if (e.key != options.keys.last) const Divider(height: 1),
              ]);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
