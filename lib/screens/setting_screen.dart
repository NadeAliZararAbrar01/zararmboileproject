import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _remindersEnabled = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.teal[50],
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: isDarkMode ? Colors.black : Colors.grey[50],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Theme toggle
            _buildCard(
              child: ListTile(
                leading: Icon(
                  isDarkMode ? Icons.nights_stay : Icons.wb_sunny,
                  color: Colors.teal[700],
                ),
                title: const Text('Theme'),
                subtitle: Text(isDarkMode ? 'Dark Mode' : 'Light Mode'),
                trailing: Switch(
                  value: isDarkMode,
                  onChanged: (_) => themeProvider.toggleTheme(),
                  activeThumbColor: Colors.teal[700],
                ),
              ),
            ),
            // Reminders toggle
            _buildCard(
              child: ListTile(
                leading: Icon(Icons.notifications, color: Colors.teal[700]),
                title: const Text('Reminders'),
                subtitle: const Text('Enable daily Azkar reminders'),
                trailing: Switch(
                  value: _remindersEnabled,
                  onChanged: (val) => setState(() => _remindersEnabled = val),
                  activeThumbColor: Colors.teal[700],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // About card
            _buildCard(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info_outline, color: Colors.teal[700]),
                        const SizedBox(width: 8),
                        Text(
                          'About DhikrEase',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'DhikrEase is your comprehensive Islamic companion app for daily Azkar, Duas, and remembrance of Allah. All content is based on authentic sources from the Quran and Hadith.',
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.5,
                        color: isDarkMode ? Colors.white70 : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Divider(color: Colors.grey[300]),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Version',
                          style: TextStyle(
                            color: isDarkMode
                                ? Colors.white54
                                : Colors.grey[600],
                          ),
                        ),
                        Text(
                          '1.0.0',
                          style: TextStyle(
                            color: Colors.teal[700],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: child,
    );
  }
}
