
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/theme_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool remindersEnabled = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal[700],
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            // PROFILE HEADER
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.teal[100],
                      child: Icon(
                        Icons.person,
                        size: 55,
                        color: Colors.teal[800],
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'DhikrEase User',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text('Welcome to your profile'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // PREFERENCES
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Preferences',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // DARK MODE
            _buildCard(
              child: ListTile(
                leading: Icon(
                  isDarkMode ? Icons.nights_stay : Icons.wb_sunny,
                  color: Colors.teal[700],
                ),
                title: const Text('Dark Mode'),
                subtitle: Text(
                  isDarkMode ? 'Enabled' : 'Disabled',
                ),
                trailing: Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    themeProvider.toggleTheme();
                  },
                  activeThumbColor: Colors.teal[700],
                ),
              ),
            ),

            // REMINDERS
            _buildCard(
              child: ListTile(
                leading: Icon(
                  Icons.notifications,
                  color: Colors.teal[700],
                ),
                title: const Text('Reminders'),
                subtitle: const Text(
                  'Enable daily Azkar reminders',
                ),
                trailing: Switch(
                  value: remindersEnabled,
                  onChanged: (value) {
                    setState(() {
                      remindersEnabled = value;
                    });
                  },
                  activeThumbColor: Colors.teal[700],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ABOUT HEADING
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'About',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // ABOUT CARD
            _buildCard(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.teal[700],
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'About DhikrEase',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'DhikrEase is your Islamic companion app '
                          'for daily Azkar, Duas, and remembrance '
                          'of Allah.',
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 15),

                    const Divider(),

                    const SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('App Version'),
                        Text(
                          '1.0.0',
                          style: TextStyle(
                            color: Colors.teal[700],
                            fontWeight: FontWeight.bold,
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

  // REUSABLE CARD FUNCTION
  Widget _buildCard({required Widget child}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: child,
    );
  }
}
