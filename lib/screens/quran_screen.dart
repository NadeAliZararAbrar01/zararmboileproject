
import 'package:flutter/material.dart';

// Individual Ayat  data
class AyahData {
  final String arabic;
  final String urdu;

  const AyahData({
    required this.arabic,
    required this.urdu,
  });
}

// Surah complete data
class SurahData {
  final String name;
  final String urduName;
  final String meaning;
  final List<AyahData> ayahs;

  const SurahData({
    required this.name,
    required this.urduName,
    required this.meaning,
    required this.ayahs,
  });
}

// Quran  selected Surahs
const List<SurahData> quranSurahs = [

  // Surah Al-Fatihah
  SurahData(
    name: 'Al-Fatihah',
    urduName: 'سورۃ الفاتحہ',
    meaning: 'The Opening',
    ayahs: [
      AyahData(arabic: 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ', urdu: 'شروع اللہ کے نام سے جو نہایت مہربان، بے حد رحم کرنے والا ہے۔'),
      AyahData(arabic: 'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ', urdu: 'تمام تعریفیں اللہ ہی کے لیے ہیں جو تمام جہانوں کا پروردگار ہے۔'),
      AyahData(arabic: 'الرَّحْمَٰنِ الرَّحِيمِ', urdu: 'نہایت مہربان، بے حد رحم کرنے والا ہے۔'),
      AyahData(arabic: 'مَالِكِ يَوْمِ الدِّينِ', urdu: 'روزِ جزا کا مالک ہے۔'),
      AyahData(arabic: 'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ', urdu: 'ہم تیری ہی عبادت کرتے ہیں اور تجھ ہی سے مدد مانگتے ہیں۔'),
      AyahData(arabic: 'اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ', urdu: 'ہمیں سیدھے راستے پر چلا۔'),
      AyahData(arabic: 'صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ', urdu: 'ان لوگوں کے راستے پر جن پر تو نے انعام فرمایا، نہ کہ ان کے جن پر غضب ہوا اور نہ گمراہوں کے راستے پر۔'),
    ],
  ),

  // Surah Al-Asr
  SurahData(
    name: 'Al-Asr',
    urduName: 'سورۃ العصر',
    meaning: 'The Time',
    ayahs: [
      AyahData(arabic: 'وَالْعَصْرِ', urdu: 'زمانے کی قسم۔'),
      AyahData(arabic: 'إِنَّ الْإِنْسَانَ لَفِي خُسْرٍ', urdu: 'بے شک انسان خسارے میں ہے۔'),
      AyahData(arabic: 'إِلَّا الَّذِينَ آمَنُوا وَعَمِلُوا الصَّالِحَاتِ وَتَوَاصَوْا بِالْحَقِّ وَتَوَاصَوْا بِالصَّبْرِ', urdu: 'سوائے ان لوگوں کے جو ایمان لائے، نیک اعمال کیے، ایک دوسرے کو حق کی نصیحت کی اور صبر کی نصیحت کی۔'),
    ],
  ),

  // Surah Al-Kawthar
  SurahData(
    name: 'Al-Kawthar',
    urduName: 'سورۃ الکوثر',
    meaning: 'Abundance',
    ayahs: [
      AyahData(arabic: 'إِنَّا أَعْطَيْنَاكَ الْكَوْثَرَ', urdu: 'بے شک ہم نے آپ کو کوثر عطا فرمائی۔'),
      AyahData(arabic: 'فَصَلِّ لِرَبِّكَ وَانْحَرْ', urdu: 'پس آپ اپنے رب کے لیے نماز پڑھیں اور قربانی کریں۔'),
      AyahData(arabic: 'إِنَّ شَانِئَكَ هُوَ الْأَبْتَرُ', urdu: 'بے شک آپ کا دشمن ہی بے نام و نشان رہے گا۔'),
    ],
  ),

  // Surah Al-Kafirun
  SurahData(
    name: 'Al-Kafirun',
    urduName: 'سورۃ الکافرون',
    meaning: 'The Disbelievers',
    ayahs: [
      AyahData(arabic: 'قُلْ يَا أَيُّهَا الْكَافِرُونَ', urdu: 'کہہ دیجیے: اے کافرو!'),
      AyahData(arabic: 'لَا أَعْبُدُ مَا تَعْبُدُونَ', urdu: 'میں ان کی عبادت نہیں کرتا جن کی تم عبادت کرتے ہو۔'),
      AyahData(arabic: 'وَلَا أَنْتُمْ عَابِدُونَ مَا أَعْبُدُ', urdu: 'اور نہ تم اس کی عبادت کرنے والے ہو جس کی میں عبادت کرتا ہوں۔'),
      AyahData(arabic: 'وَلَا أَنَا عَابِدٌ مَا عَبَدْتُمْ', urdu: 'اور نہ میں ان کی عبادت کرنے والا ہوں جن کی تم نے عبادت کی۔'),
      AyahData(arabic: 'وَلَا أَنْتُمْ عَابِدُونَ مَا أَعْبُدُ', urdu: 'اور نہ تم اس کی عبادت کرنے والے ہو جس کی میں عبادت کرتا ہوں۔'),
      AyahData(arabic: 'لَكُمْ دِينُكُمْ وَلِيَ دِينِ', urdu: 'تمہارے لیے تمہارا دین ہے اور میرے لیے میرا دین۔'),
    ],
  ),

  // Surah Al-Ikhlas
  SurahData(
    name: 'Al-Ikhlas',
    urduName: 'سورۃ الاخلاص',
    meaning: 'The Sincerity',
    ayahs: [
      AyahData(arabic: 'قُلْ هُوَ اللَّهُ أَحَدٌ', urdu: 'کہہ دیجیے: وہ اللہ ایک ہے۔'),
      AyahData(arabic: 'اللَّهُ الصَّمَدُ', urdu: 'اللہ بے نیاز ہے، سب اس کے محتاج ہیں۔'),
      AyahData(arabic: 'لَمْ يَلِدْ وَلَمْ يُولَدْ', urdu: 'نہ اس کی کوئی اولاد ہے اور نہ وہ کسی کی اولاد ہے۔'),
      AyahData(arabic: 'وَلَمْ يَكُنْ لَهُ كُفُوًا أَحَدٌ', urdu: 'اور کوئی بھی اس کے برابر نہیں۔'),
    ],
  ),

  // Surah Al-Falaq
  SurahData(
    name: 'Al-Falaq',
    urduName: 'سورۃ الفلق',
    meaning: 'The Daybreak',
    ayahs: [
      AyahData(arabic: 'قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ', urdu: 'کہہ دیجیے: میں صبح کے رب کی پناہ مانگتا ہوں۔'),
      AyahData(arabic: 'مِنْ شَرِّ مَا خَلَقَ', urdu: 'ہر اس چیز کے شر سے جو اس نے پیدا کی۔'),
      AyahData(arabic: 'وَمِنْ شَرِّ غَاسِقٍ إِذَا وَقَبَ', urdu: 'اور اندھیری رات کے شر سے جب وہ چھا جائے۔'),
      AyahData(arabic: 'وَمِنْ شَرِّ النَّفَّاثَاتِ فِي الْعُقَدِ', urdu: 'اور گرہوں میں پھونکنے والیوں کے شر سے۔'),
      AyahData(arabic: 'وَمِنْ شَرِّ حَاسِدٍ إِذَا حَسَدَ', urdu: 'اور حسد کرنے والے کے شر سے جب وہ حسد کرے۔'),
    ],
  ),

  // Surah An-Naas
  SurahData(
    name: 'An-Naas',
    urduName: 'سورۃ الناس',
    meaning: 'The Mankind',
    ayahs: [
      AyahData(arabic: 'قُلْ أَعُوذُ بِرَبِّ النَّاسِ', urdu: 'کہہ دیجیے: میں لوگوں کے رب کی پناہ مانگتا ہوں۔'),
      AyahData(arabic: 'مَلِكِ النَّاسِ', urdu: 'لوگوں کے بادشاہ کی۔'),
      AyahData(arabic: 'إِلَٰهِ النَّاسِ', urdu: 'لوگوں کے معبود کی۔'),
      AyahData(arabic: 'مِنْ شَرِّ الْوَسْوَاسِ الْخَنَّاسِ', urdu: 'وسوسہ ڈالنے والے، پیچھے ہٹ جانے والے کے شر سے۔'),
      AyahData(arabic: 'الَّذِي يُوَسْوِسُ فِي صُدُورِ النَّاسِ', urdu: 'جو لوگوں کے سینوں میں وسوسے ڈالتا ہے۔'),
      AyahData(arabic: 'مِنَ الْجِنَّةِ وَالنَّاسِ', urdu: 'خواہ وہ جنوں میں سے ہو یا انسانوں میں سے۔'),
    ],
  ),
];

// Main Quran Screen
class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8F6),
      appBar: AppBar(
        title: const Text('Quran with Urdu Translation'),
        backgroundColor: const Color(0xFF137C68),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: quranSurahs.length,
        itemBuilder: (context, index) {
          final surah = quranSurahs[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: CircleAvatar(
                backgroundColor: const Color(0xFFE6F3EF),
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                    color: Color(0xFF137C68),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                surah.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                '${surah.meaning} • ${surah.ayahs.length} Ayat', //surah is object and meanin gits property
              ),
              trailing: Text(
                surah.urduName,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  fontSize: 17,
                  color: Color(0xFF137C68),
                ),
              ),

              // Surah par click karne se reading screen open hogi
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SurahReadingScreen(
                      surah: surah,
                      surahIndex: index,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// Surah Reading Screen
class SurahReadingScreen extends StatelessWidget {
  final SurahData surah;
  final int surahIndex;

  const SurahReadingScreen({
    super.key,
    required this.surah,
    required this.surahIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8F6),
      appBar: AppBar(
        title: Text(surah.urduName),
        backgroundColor: const Color(0xFF137C68),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Surah heading
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF137C68),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                Text(
                  surah.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  surah.meaning,
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 12),
                const Text(
                  'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),

          // Arabic Ayat and Urdu meaning
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: surah.ayahs.length,
              itemBuilder: (context, index) {
                final ayah = surah.ayahs[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 14),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Ayah number
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: const Color(0xFFE6F3EF),
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                color: Color(0xFF137C68),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 18),

                        // Arabic text
                        Text(
                          ayah.arabic,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 27,
                            height: 2,
                            color: Color(0xFF174D40),
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const Divider(height: 30),

                        // Urdu meaning
                        const Text(
                          'آسان اردو مفہوم',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: Color(0xFF137C68),
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          ayah.urdu,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 17,
                            height: 1.8,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Previous and Next Surah buttons
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: surahIndex > 0
                        ? () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SurahReadingScreen(
                            surah: quranSurahs[surahIndex - 1],
                            surahIndex: surahIndex - 1,
                          ),
                        ),
                      );
                    }
                        : null,
                    child: const Text('Previous Surah'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF137C68),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: surahIndex < quranSurahs.length - 1
                        ? () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SurahReadingScreen(
                            surah: quranSurahs[surahIndex + 1],
                            surahIndex: surahIndex + 1,
                          ),
                        ),
                      );
                    }
                        : null,
                    child: const Text('Next Surah'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
