

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:adhan/adhan.dart';

import 'habbit_provider.dart';
import 'tasbeeh_counter_screen.dart';
import 'dua_screen.dart';
import '../utils/theme_provider.dart';
import 'azkar_screen.dart';
import 'favourite_screen.dart';
import 'profile_screen.dart';
import 'asma_ul_husna_screen.dart';
import 'prayer_times_screen.dart';
import 'quran_screen.dart';

// MAIN HOME SCREEN
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> screens = const [
    HomeContent(),
    AzkarMenuScreen(),
    FavouriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF137C68),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_rounded),
            label: 'Azkar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// HOME CONTENT
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final habit = context.watch<HabitProvider>();
    final themeProvider = context.watch<ThemeProvider>();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // TOP HEADER
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 25),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF073D35),
                      Color(0xFF137C68),
                      Color(0xFF239B82),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(28),
                    bottomRight: Radius.circular(28),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // APP NAME AND THEME BUTTON
                    Row(
                      children: [
                        const Icon(
                          Icons.mosque_rounded,
                          color: Colors.white,
                          size: 35,
                        ),
                        const SizedBox(width: 12),

                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'DhikrEase',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Your Daily Islamic Companion',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),

                        IconButton(
                          onPressed: () {
                            themeProvider.toggleTheme();
                          },
                          icon: Icon(
                            themeProvider.themeMode == ThemeMode.light
                                ? Icons.dark_mode_rounded
                                : Icons.light_mode_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      'Assalamu Alaikum!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      'Make every day meaningful with Dhikr.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ARABIC QUOTE
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.13),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.white24),
                      ),
                      child: const Column(
                        children: [
                          Text(
                            'وَاذْكُرُوا اللَّهَ كَثِيرًا',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'And remember Allah often.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // HOME BODY
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text(
                      'Your Islamic Journey',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 14),

                    // NEXT PRAYER
                    const NextPrayerCountdown(),

                    const SizedBox(height: 22),

                    // QURAN BANNER
                    _quranBanner(context),

                    const SizedBox(height: 24),

                    // DAILY AZKAR
                    const Text(
                      'Daily Azkar',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Expanded(
                          child: _azkarCard(
                            context,
                            title: 'Morning Azkar',
                            count: habit.morningAzkarCount,
                            icon: Icons.wb_sunny_rounded,
                            color: Colors.orange,
                            type: 'Morning',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _azkarCard(
                            context,
                            title: 'Evening Azkar',
                            count: habit.eveningAzkarCount,
                            icon: Icons.nights_stay_rounded,
                            color: Colors.indigo,
                            type: 'Evening',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    // TOTAL COUNT
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.white10
                            : const Color(0xFFE6F3EF),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.auto_awesome_rounded,
                            color: Color(0xFF137C68),
                            size: 28,
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text(
                              'Total Azkar Count',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            '${habit.total}',
                            style: const TextStyle(
                              fontSize: 21,
                              color: Color(0xFF137C68),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    // QUICK ACCESS
                    const Text(
                      'Explore DhikrEase',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // FIRST ROW
                    Row(
                      children: [
                        Expanded(
                          child: _quickCard(
                            context,
                            title: 'Tasbeeh',
                            subtitle: 'Count Dhikr',
                            icon: Icons.touch_app_rounded,
                            color: const Color(0xFF137C68),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                  const TasbeehCounterScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _quickCard(
                            context,
                            title: 'Dua Library',
                            subtitle: 'Read Duas',
                            icon: Icons.menu_book_rounded,
                            color: const Color(0xFF946B27),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const DuaScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // SECOND ROW
                    Row(
                      children: [
                        Expanded(
                          child: _quickCard(
                            context,
                            title: '99 Names',
                            subtitle: 'Asma-ul-Husna',
                            icon: Icons.auto_awesome_rounded,
                            color: Colors.deepPurple,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                  const AsmaUlHusnaScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _quickCard(
                            context,
                            title: 'Prayer Times',
                            subtitle: 'Namaz Calendar',
                            icon: Icons.access_time_rounded,
                            color: Colors.blue,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                  const PrayerTimesScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 22),

                    // RESET BUTTON
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          context.read<HabitProvider>().resetCounts();

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Azkar counts reset successfully.',
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.refresh_rounded),
                        label: const Text('Reset Azkar Counts'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // QURAN BANNER
  Widget _quranBanner(BuildContext context) {
    return InkWell(    //make digigt to clickable
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const QuranScreen(),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF946B27),
              Color(0xFFBD9148),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.menu_book_rounded,
              color: Colors.white,
              size: 42,
            ),
            const SizedBox(width: 14),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quran with Translation',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Read Surahs with Urdu meaning',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }

  // AZKAR CARD
  Widget _azkarCard(
      BuildContext context, {
        required String title,
        required int count,
        required IconData icon,
        required Color color,
        required String type,
      }) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AzkarScreen(type: type),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: color.withOpacity(0.10),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: color.withOpacity(0.25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Count: $count',
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // QUICK ACCESS CARD
  Widget _quickCard(
      BuildContext context, {
        required String title,
        required String subtitle,
        required IconData icon,
        required Color color,
        required VoidCallback onTap,
      }) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 8,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 34),
            const SizedBox(height: 9),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// NEXT PRAYER COUNTDOWN
class NextPrayerCountdown extends StatefulWidget {
  const NextPrayerCountdown({super.key});

  @override
  State<NextPrayerCountdown> createState() =>
      _NextPrayerCountdownState();
}

class _NextPrayerCountdownState extends State<NextPrayerCountdown> {
  final Coordinates coordinates = Coordinates(30.81, 73.45);

  Timer? timer;

  String nextPrayerName = 'Loading...';
  DateTime nextPrayerTime = DateTime.now();

  @override
  void initState() {
    super.initState();

    updateNextPrayer();

    timer = Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        updateNextPrayer();
      },
    );
  }

  PrayerTimes calculateTimes(DateTime date) {
    final params = CalculationMethod.karachi.getParameters();  //= parametric values
    params.madhab = Madhab.hanafi;

    return PrayerTimes(
      coordinates,
      DateComponents(date.year, date.month, date.day),
      params,
      utcOffset: const Duration(hours: 5),
    );
  }

  void updateNextPrayer() {
    final now = DateTime.now();

    final todayTimes = calculateTimes(now);
    final tomorrow = now.add(const Duration(days: 1));
    final tomorrowTimes = calculateTimes(tomorrow);

    final List<MapEntry<String, DateTime>> prayers = [
      MapEntry('Fajr', todayTimes.fajr),
      MapEntry('Dhuhr', todayTimes.dhuhr),
      MapEntry('Asr', todayTimes.asr),
      MapEntry('Maghrib', todayTimes.maghrib),
      MapEntry('Isha', todayTimes.isha),
    ];

    MapEntry<String, DateTime>? selectedPrayer;

    for (final prayer in prayers) {
      if (prayer.value.isAfter(now)) {
        selectedPrayer = prayer;
        break;
      }
    }

    final prayerToShow = selectedPrayer ??
        MapEntry<String, DateTime>(
          'Fajr',
          tomorrowTimes.fajr,
        );

    if (mounted) {
      setState(() {
        nextPrayerName = prayerToShow.key;
        nextPrayerTime = prayerToShow.value;
      });
    }
  }

  String getRemainingTime() {
    final difference = nextPrayerTime.difference(DateTime.now());

    if (difference.isNegative) {
      return '00:00:00';
    }

    final hours = difference.inHours;
    final minutes = difference.inMinutes.remainder(60);
    final seconds = difference.inSeconds.remainder(60);

    return '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }

  String getFormattedPrayerTime() {
    int hour = nextPrayerTime.hour;
    final minute = nextPrayerTime.minute;

    final period = hour >= 12 ? 'PM' : 'AM';

    hour = hour % 12;

    if (hour == 0) {
      hour = 12;
    }

    return '${hour.toString().padLeft(2, '0')}:'
        '${minute.toString().padLeft(2, '0')} $period';
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF073D35),
            Color(0xFF137C68),
            Color(0xFF239B82),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.access_time_rounded,
                color: Colors.white,
              ),
              SizedBox(width: 9),
              Text(
                'NEXT PRAYER',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          Text(
            nextPrayerName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            getFormattedPrayerTime(),
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 18),

          const Text(
            'TIME REMAINING',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 7),

          Text(
            getRemainingTime(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),

          const SizedBox(height: 12),

          const Row(
            children: [
              Icon(
                Icons.location_on_rounded,
                color: Colors.white70,
                size: 16,
              ),
              SizedBox(width: 5),
              Text(
                'Prayer timings for Okara',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// AZKAR MENU SCREEN
class AzkarMenuScreen extends StatelessWidget {
  const AzkarMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Azkar'),
        backgroundColor: const Color(0xFF137C68),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // 99 NAMES
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.auto_awesome_rounded,
                color: Color(0xFF946B27),
                size: 30,
              ),
              title: const Text('99 Names of Allah'),
              subtitle: const Text('Explore Asma-ul-Husna'),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AsmaUlHusnaScreen(),
                  ),
                );
              },
            ),
          ),

          // MORNING AZKAR
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.wb_sunny_rounded,
                color: Colors.orange,
                size: 30,
              ),
              title: const Text('Morning Azkar'),
              subtitle: const Text('Read your morning Azkar'),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                    const AzkarScreen(type: 'Morning'),
                  ),
                );
              },
            ),
          ),

          // EVENING AZKAR
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.nights_stay_rounded,
                color: Color(0xFF137C68),
                size: 30,
              ),
              title: const Text('Evening Azkar'),
              subtitle: const Text('Read your evening Azkar'),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                    const AzkarScreen(type: 'Evening'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
