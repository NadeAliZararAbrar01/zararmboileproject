
import 'package:flutter/material.dart';
import 'FavouriteAazkar.dart';
import 'favorite_azkar_store.dart';

// 1. Azkar Model
class Azkar {
  final String id;
  final String title;
  final String arabic;
  final String transliteration;
  final String urdu;
  final int targetCount;

  Azkar({
    this.id = '',
    required this.title,
    required this.arabic,
    required this.transliteration,
    required this.urdu,
    required this.targetCount,
  });

  // Convert Firestore data into Azkar object
  factory Azkar.fromFirestore(
      Map<String, dynamic> data, {
        String id = '',
      }) {
    return Azkar(
      id: id,
      title: data['title'] ?? '',
      arabic: data['arabic'] ?? '',
      transliteration: data['transliteration'] ?? '',
      urdu: data['urdu'] ?? '',
      targetCount: data['targetCount'] ?? 1,
    );
  }
}

// 2. Local Azkar Data
List<Azkar> azkarList = [

  // Morning Azkar
  Azkar(
    title: 'Morning',
    arabic:
    'أَصْبَحْنَا وَأَصْبَحَ الْمُلْكُ لِلَّهِ، وَالْحَمْدُ لِلَّهِ، لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ',
    transliteration:
    'Aṣbaḥnā wa aṣbaḥa-l-mulku lillāh, wal-ḥamdu lillāh, lā ilāha illallāh waḥdahu lā sharīka lah',
    urdu:
    'ہم نے صبح کی اور اللہ کی بادشاہی نے بھی صبح کی، اور تمام تعریفیں اللہ کے لیے ہیں۔',
    targetCount: 1,
  ),

  Azkar(
    title: 'Morning',
    arabic:
    'اللَّهُمَّ بِكَ أَصْبَحْنَا، وَبِكَ أَمْسَيْنَا، وَبِكَ نَحْيَا، وَبِكَ نَمُوتُ، وَإِلَيْكَ النُّشُورُ',
    transliteration:
    'Allāhumma bika aṣbaḥnā, wa bika amsaynā, wa bika naḥyā, wa bika namūtu, wa ilayka-n-nushūr',
    urdu:
    'اے اللہ! تیری ہی توفیق سے ہم نے صبح کی، اور تیری ہی توفیق سے ہم نے شام کی۔',
    targetCount: 1,
  ),

  Azkar(
    title: 'Morning',
    arabic:
    'سُبْحَانَ اللهِ وَبِحَمْدِهِ: عَدَدَ خَلْقِهِ، وَرِضَا نَفْسِهِ، وَزِنَةَ عَرْشِهِ، وَمِدَادَ كَلِمَاتِهِ',
    transliteration:
    "Subḥānallāhi wa biḥamdihi: 'adada khalqihi, wa riḍā nafsihi, wa zinata 'arshihi, wa midāda kalimātihi",
    urdu:
    'اللہ اپنی تعریفوں کے ساتھ پاک ہے، اس کی مخلوق کی گنتی کے برابر۔',
    targetCount: 3,
  ),

  Azkar(
    title: 'Morning',
    arabic:
    'بِسْمِ اللَّهِ الَّذِي لَا يَضُرُّ مَعَ اسْمِهِ شَيْءٌ فِي الْأَرْضِ وَلَا فِي السَّمَاءِ وَهُوَ السَّمِيعُ الْعَلِيمُ',
    transliteration:
    "Bismillāhilladhī lā yaḍurru ma'asmihi shay'un fil-arḍi wa lā fis-samā'i wa huwas-samī'ul-'alīm",
    urdu:
    'اللہ کے نام کے ساتھ جس کے نام کی برکت سے زمین اور آسمان کی کوئی چیز نقصان نہیں پہنچا سکتی۔',
    targetCount: 3,
  ),

  // Evening Azkar
  Azkar(
    title: 'Evening',
    arabic:
    'أَمْسَيْنَا وَأَمْسَى الْمُلْكُ لِلَّهِ وَالْحَمْدُ لِلَّهِ لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ',
    transliteration:
    'Amsaynā wa amsa-l-mulku lillāh, wal-ḥamdu lillāh, lā ilāha illallāh waḥdahu',
    urdu:
    'ہم نے شام کی اور اللہ کی بادشاہی کے ساتھ تمام تعریفیں اللہ کے لیے ہیں۔',
    targetCount: 1,
  ),

  Azkar(
    title: 'Evening',
    arabic:
    'اللَّهُمَّ بِكَ أَمْسَيْنَا، وَبِكَ أَصْبَحْنَا، وَبِكَ نَحْيَا، وَبِكَ نَمُوتُ، وَإِلَيْكَ الْمَصِيرُ',
    transliteration:
    'Allāhumma bika amsaynā, wa bika aṣbaḥnā, wa bika naḥyā, wa bika namūtu, wa ilayka-l-maṣīr',
    urdu: 'اے اللہ! ہم تیری مدد سے شام میں داخل ہوئے۔',
    targetCount: 1,
  ),

  Azkar(
    title: 'Evening',
    arabic: 'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ',
    transliteration: 'Subḥānallāhi wa biḥamdih',
    urdu: 'اللہ پاک ہے اور اس کی تعریف کے لائق ہے۔',
    targetCount: 100,
  ),

  Azkar(
    title: 'Evening',
    arabic: 'أَسْتَغْفِرُ اللَّهَ وَأَتُوبُ إِلَيْهِ',
    transliteration: 'Astaghfirullāha wa atūbu ilayh',
    urdu: 'میں اللہ سے معافی مانگتا ہوں اور اس کی طرف توبہ کرتا ہوں۔',
    targetCount: 100,
  ),

  Azkar(
    title: 'Evening',
    arabic:
    'سُبْحَانَ اللَّهِ، وَالْحَمْدُ لِلَّهِ، وَلَا إِلَهَ إِلَّا اللَّهُ، وَاللَّهُ أَكْبَرُ',
    transliteration:
    'Subḥānallāh, wal-ḥamdu lillāh, wa lā ilāha illallāh, wallāhu akbar',
    urdu:
    'اللہ پاک ہے، تمام تعریفیں اللہ کے لیے ہیں، اور اللہ سب سے بڑا ہے۔',
    targetCount: 33,
  ),
];

// 3. Azkar Screen
class AzkarScreen extends StatefulWidget {
  final String type;

  const AzkarScreen({
    super.key,
    required this.type,
  });

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {

  // Store separate count for every Zikr
  final Map<int, int> zikrCounts = {};

  @override
  Widget build(BuildContext context) {

    // Filter Morning or Evening Azkar
    final filteredAzkar = azkarList
        .where((azkar) => azkar.title == widget.type)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.type} Azkar'),
        backgroundColor: Colors.teal[700],
        foregroundColor: Colors.white,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: filteredAzkar.length,

        itemBuilder: (context, index) {

          final azkar = filteredAzkar[index];
          // Unique key for each Zikr
          final favoriteKey = '${azkar.title}|${azkar.arabic}';
          // Get current count of this Zikr
          final currentCount = zikrCounts[index] ?? 0;

          // Check whether target is completed
          final isCompleted =
              currentCount >= azkar.targetCount;

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 3,

            child: Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  // Azkar Number
                 // Text(
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${widget.type} Azkar ${index + 1}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                        ),

                        AnimatedBuilder(
                          animation: FavoriteAzkarStore.instance,
                          builder: (context, child) {
                            final isFavorite =
                            FavoriteAzkarStore.instance.isFavorite(favoriteKey);

                            return IconButton(
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red,
                                size: 28,
                              ),
                              onPressed: () {
                                FavoriteAzkarStore.instance.toggleFavorite(favoriteKey);
                              },
                            );
                          },
                        ),
                      ],
                    ),


                  const SizedBox(height: 16),

                  // Arabic Text
                  Text(
                    azkar.arabic,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                      fontSize: 25,
                      height: 2,
                    ),
                  ),

                  const Divider(height: 28),

                  // Transliteration
                  const Text(
                    'Transliteration',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    azkar.transliteration,
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Urdu Translation
                  const Text(
                    'Urdu Translation',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    azkar.urdu,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                      fontSize: 17,
                      height: 1.8,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Target Count
                  Text(
                    'Target: ${azkar.targetCount} times',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Current Counter Display
                  Center(
                    child: Text(
                      '$currentCount / ${azkar.targetCount}',
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Clickable Counter Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: Icon(
                        isCompleted
                            ? Icons.check_circle
                            : Icons.touch_app,
                      ),

                      label: Text(
                        isCompleted
                            ? 'Completed'
                            : 'Tap to Count',
                      ),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: isCompleted
                            ? Colors.green
                            : Colors.teal[700],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(15),
                      ),

                      // Increase only this Zikr's count
                      onPressed: isCompleted
                          ? null
                          : () {
                        setState(() {
                          zikrCounts[index] =
                              currentCount + 1;
                        });
                      },
                    ),
                  ),

                  // Completion Message
                  if (isCompleted)
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'This Zikr target is completed!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
