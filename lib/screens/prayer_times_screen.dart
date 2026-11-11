
import 'package:flutter/material.dart';
import 'package:adhan/adhan.dart';

class PrayerTimesScreen extends StatefulWidget {
  const PrayerTimesScreen({super.key});

  @override
  State<PrayerTimesScreen> createState() =>
      _PrayerTimesScreenState();
}

class _PrayerTimesScreenState extends State<PrayerTimesScreen> {

  // Okara coordinates
  final Coordinates coordinates =  //final not assign the value of variable again
  Coordinates(30.81, 73.45);

  // Selected date
  DateTime selectedDate = DateTime.now();

  // Displayed calendar month
  DateTime displayedMonth = DateTime.now();

  // Convert time into 12-hour format
  String formatTime(DateTime time) {
    final hour = time.hour % 12 == 0 ? 12 : time.hour % 12;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.hour >= 12 ? 'PM' : 'AM';

    return '$hour:$minute $period';
  }

  // Calculate prayer timings
  PrayerTimes calculateTimes(DateTime date, Madhab madhab) {
    final params = CalculationMethod.karachi.getParameters();

    params.madhab = madhab;  // prayer setting calculation

    return PrayerTimes(
      coordinates,
      DateComponents(date.year, date.month, date.day),
      params,
      utcOffset: const Duration(hours: 5),
    );
  }

  // Previous month
  void previousMonth() {
    setState(() {
      displayedMonth = DateTime(
        displayedMonth.year,
        displayedMonth.month - 1,
      );
    });
  }

  // Next month
  void nextMonth() {
    setState(() {
      displayedMonth = DateTime(
        displayedMonth.year,
        displayedMonth.month + 1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    // Hanafi prayer timings
    final hanafiTimes =
    calculateTimes(selectedDate, Madhab.hanafi);

    // Shafi prayer timings
    final shafiTimes =
    calculateTimes(selectedDate, Madhab.shafi);

    // Total days in selected month
    final daysInMonth = DateTime(
      displayedMonth.year,
      displayedMonth.month + 1,
      0,
    ).day;

    // First weekday of month
    final firstWeekday = DateTime(
      displayedMonth.year,
      displayedMonth.month,
      1,
    ).weekday % 7;

    return Scaffold(
      backgroundColor: const Color(0xFFF2F7F5),

      appBar: AppBar(
        title: const Text(
          'Prayer Times',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF145A50),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Location card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),

              decoration: BoxDecoration(
                color: const Color(0xFF145A50),
                borderRadius: BorderRadius.circular(20),
              ),

              child: const Column(
                children: [
                  Icon(
                    Icons.mosque,
                    color: Colors.white,
                    size: 42,
                  ),

                  SizedBox(height: 10),

                  Text(
                    'Prayer Times',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 6),

                  Text(
                    'Okara, Punjab, Pakistan',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            // Calendar heading
            const Text(
              'Namaz Calendar',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // Calendar
            Card(
              color: Colors.white,
              elevation: 2,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),

              child: Padding(
                padding: const EdgeInsets.all(14),

                child: Column(
                  children: [

                    // Month navigation
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                      children: [
                        IconButton(
                          onPressed: previousMonth,
                          icon: const Icon(Icons.chevron_left),
                        ),

                        Text(
                          '${monthName(displayedMonth.month)} ${displayedMonth.year}',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        IconButton(
                          onPressed: nextMonth,
                          icon: const Icon(Icons.chevron_right),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Weekdays

                    Row(
                      children: [
                        Expanded(child: Center(child: Text('Sun'))),
                        Expanded(child: Center(child: Text('Mon'))),
                        Expanded(child: Center(child: Text('Tue'))),
                        Expanded(child: Center(child: Text('Wed'))),
                        Expanded(child: Center(child: Text('Thu'))),
                        Expanded(child: Center(child: Text('Fri'))),
                        Expanded(child: Center(child: Text('Sat'))),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Calendar dates
                    GridView.builder(  //display items into row and clm phase
                      shrinkWrap: true, // grid view adjust heading accord to it self
                      physics:
                      const NeverScrollableScrollPhysics(), //user not scroll gridview independently

                      itemCount: firstWeekday + daysInMonth,

                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                        childAspectRatio: 1,
                      ),

                      itemBuilder: (context, index) {

                        if (index < firstWeekday) {
                          return const SizedBox();
                        }

                        final day = index - firstWeekday + 1;

                        final date = DateTime(
                          displayedMonth.year,
                          displayedMonth.month,
                          day,
                        );

                        final isSelected =
                            selectedDate.year == date.year &&
                                selectedDate.month == date.month &&
                                selectedDate.day == date.day;

                        final isToday =
                        DateUtils.isSameDay(
                          date,
                          DateTime.now(),
                        );

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDate = date;
                            });
                          },

                          child: Container(
                            margin: const EdgeInsets.all(3),

                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF145A50)
                                  : Colors.transparent,

                              borderRadius:
                              BorderRadius.circular(9),

                              border: isToday && !isSelected
                                  ? Border.all(color: Colors.teal)
                                  : null,
                            ),

                            child: Center(
                              child: Text(
                                '$day',

                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.black87,

                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 22),

            // Selected date heading
            Text(
              'Prayer Schedule - ${selectedDate.day} ${monthName(selectedDate.month)}',

              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // Prayer timings
            prayerCard(
              'Fajr',
              Icons.wb_twilight,
              formatTime(hanafiTimes.fajr),
            ),

            prayerCard(
              'Dhuhr',
              Icons.wb_sunny,
              formatTime(hanafiTimes.dhuhr),
            ),

            prayerCard(
              'Asr - Hanafi',
              Icons.wb_cloudy,
              formatTime(hanafiTimes.asr),
            ),

            prayerCard(
              'Asr - Shafi',
              Icons.wb_cloudy_outlined,
              formatTime(shafiTimes.asr),
            ),

            prayerCard(
              'Maghrib',
              Icons.nights_stay,
              formatTime(hanafiTimes.maghrib),
            ),

            prayerCard(
              'Isha',
              Icons.nightlight_round,
              formatTime(hanafiTimes.isha),
            ),

            const SizedBox(height: 15),

            const Text(
              'Calculation: Karachi Method | Pakistan UTC+5',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Prayer timing card
  Widget prayerCard(String name, IconData icon, String time) {
    return Card(
      color: Colors.white,
      elevation: 2,

      margin: const EdgeInsets.symmetric(vertical: 6),

      child: ListTile(
        leading: Icon(
          icon,
          color: const Color(0xFF145A50),
          size: 28,
        ),

        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        trailing: Text(
          time,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF145A50),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Month names
  String monthName(int month) {
    const months = [
      'January', 'February', 'March', 'April',
      'May', 'June', 'July', 'August',
      'September', 'October', 'November', 'December'
    ];

    return months[month - 1];
  }
}
