
import 'package:flutter/material.dart';

class AsmaUlHusnaScreen extends StatefulWidget {
  const AsmaUlHusnaScreen({super.key});

  @override
  State<AsmaUlHusnaScreen> createState() => _AsmaUlHusnaScreenState();
}

class _AsmaUlHusnaScreenState extends State<AsmaUlHusnaScreen> {
  final TextEditingController searchController = TextEditingController();

  // 99 Names of Allah with Arabic, transliteration and meanings
  final List<Map<String, String>> names = [
    {'arabic': 'الرَّحْمَٰنُ', 'name': 'Ar-Rahman', 'meaning': 'The Most Merciful'},
    {'arabic': 'الرَّحِيمُ', 'name': 'Ar-Raheem', 'meaning': 'The Most Compassionate'},
    {'arabic': 'الْمَلِكُ', 'name': 'Al-Malik', 'meaning': 'The King'},
    {'arabic': 'الْقُدُّوسُ', 'name': 'Al-Quddus', 'meaning': 'The Most Holy'},
    {'arabic': 'السَّلَامُ', 'name': 'As-Salam', 'meaning': 'The Source of Peace'},
    {'arabic': 'الْمُؤْمِنُ', 'name': 'Al-Mumin', 'meaning': 'The Giver of Faith'},
    {'arabic': 'الْمُهَيْمِنُ', 'name': 'Al-Muhaymin', 'meaning': 'The Protector'},
    {'arabic': 'الْعَزِيزُ', 'name': 'Al-Aziz', 'meaning': 'The Almighty'},
    {'arabic': 'الْجَبَّارُ', 'name': 'Al-Jabbar', 'meaning': 'The Compeller'},
    {'arabic': 'الْمُتَكَبِّرُ', 'name': 'Al-Mutakabbir', 'meaning': 'The Supreme'},
    {'arabic': 'الْخَالِقُ', 'name': 'Al-Khaliq', 'meaning': 'The Creator'},
    {'arabic': 'الْبَارِئُ', 'name': 'Al-Bari', 'meaning': 'The Originator'},
    {'arabic': 'الْمُصَوِّرُ', 'name': 'Al-Musawwir', 'meaning': 'The Fashioner'},
    {'arabic': 'الْغَفَّارُ', 'name': 'Al-Ghaffar', 'meaning': 'The All-Forgiving'},
    {'arabic': 'الْقَهَّارُ', 'name': 'Al-Qahhar', 'meaning': 'The Subduer'},
    {'arabic': 'الْوَهَّابُ', 'name': 'Al-Wahhab', 'meaning': 'The Bestower'},
    {'arabic': 'الرَّزَّاقُ', 'name': 'Ar-Razzaq', 'meaning': 'The Provider'},
    {'arabic': 'الْفَتَّاحُ', 'name': 'Al-Fattah', 'meaning': 'The Opener'},
    {'arabic': 'الْعَلِيمُ', 'name': 'Al-Alim', 'meaning': 'The All-Knowing'},
    {'arabic': 'الْقَابِضُ', 'name': 'Al-Qabid', 'meaning': 'The Withholder'},
    {'arabic': 'الْبَاسِطُ', 'name': 'Al-Basit', 'meaning': 'The Expander'},
    {'arabic': 'الْخَافِضُ', 'name': 'Al-Khafid', 'meaning': 'The Abaser'},
    {'arabic': 'الرَّافِعُ', 'name': 'Ar-Rafi', 'meaning': 'The Exalter'},
    {'arabic': 'الْمُعِزُّ', 'name': 'Al-Muizz', 'meaning': 'The Bestower of Honor'},
    {'arabic': 'الْمُذِلُّ', 'name': 'Al-Mudhill', 'meaning': 'The Humiliator'},
    {'arabic': 'السَّمِيعُ', 'name': 'As-Sami', 'meaning': 'The All-Hearing'},
    {'arabic': 'الْبَصِيرُ', 'name': 'Al-Basir', 'meaning': 'The All-Seeing'},
    {'arabic': 'الْحَكَمُ', 'name': 'Al-Hakam', 'meaning': 'The Judge'},
    {'arabic': 'الْعَدْلُ', 'name': 'Al-Adl', 'meaning': 'The Just'},
    {'arabic': 'اللَّطِيفُ', 'name': 'Al-Latif', 'meaning': 'The Most Subtle'},
    {'arabic': 'الْخَبِيرُ', 'name': 'Al-Khabir', 'meaning': 'The All-Aware'},
    {'arabic': 'الْحَلِيمُ', 'name': 'Al-Halim', 'meaning': 'The Forbearing'},
    {'arabic': 'الْعَظِيمُ', 'name': 'Al-Azim', 'meaning': 'The Magnificent'},
    {'arabic': 'الْغَفُورُ', 'name': 'Al-Ghafur', 'meaning': 'The Forgiving'},
    {'arabic': 'الشَّكُورُ', 'name': 'Ash-Shakur', 'meaning': 'The Appreciative'},
    {'arabic': 'الْعَلِيُّ', 'name': 'Al-Ali', 'meaning': 'The Most High'},
    {'arabic': 'الْكَبِيرُ', 'name': 'Al-Kabir', 'meaning': 'The Greatest'},
    {'arabic': 'الْحَفِيظُ', 'name': 'Al-Hafiz', 'meaning': 'The Preserver'},
    {'arabic': 'الْمُقِيتُ', 'name': 'Al-Muqit', 'meaning': 'The Sustainer'},
    {'arabic': 'الْحَسِيبُ', 'name': 'Al-Hasib', 'meaning': 'The Reckoner'},
    {'arabic': 'الْجَلِيلُ', 'name': 'Al-Jalil', 'meaning': 'The Majestic'},
    {'arabic': 'الْكَرِيمُ', 'name': 'Al-Karim', 'meaning': 'The Generous'},
    {'arabic': 'الرَّقِيبُ', 'name': 'Ar-Raqib', 'meaning': 'The Watchful'},
    {'arabic': 'الْمُجِيبُ', 'name': 'Al-Mujib', 'meaning': 'The Responsive'},
    {'arabic': 'الْوَاسِعُ', 'name': 'Al-Wasi', 'meaning': 'The All-Encompassing'},
    {'arabic': 'الْحَكِيمُ', 'name': 'Al-Hakim', 'meaning': 'The All-Wise'},
    {'arabic': 'الْوَدُودُ', 'name': 'Al-Wadud', 'meaning': 'The Most Loving'},
    {'arabic': 'الْمَجِيدُ', 'name': 'Al-Majid', 'meaning': 'The Most Glorious'},
    {'arabic': 'الْبَاعِثُ', 'name': 'Al-Baith', 'meaning': 'The Resurrector'},
    {'arabic': 'الشَّهِيدُ', 'name': 'Ash-Shahid', 'meaning': 'The Witness'},
    {'arabic': 'الْحَقُّ', 'name': 'Al-Haqq', 'meaning': 'The Truth'},
    {'arabic': 'الْوَكِيلُ', 'name': 'Al-Wakil', 'meaning': 'The Trustee'},
    {'arabic': 'الْقَوِيُّ', 'name': 'Al-Qawiyy', 'meaning': 'The All-Strong'},
    {'arabic': 'الْمَتِينُ', 'name': 'Al-Matin', 'meaning': 'The Firm'},
    {'arabic': 'الْوَلِيُّ', 'name': 'Al-Waliyy', 'meaning': 'The Protecting Friend'},
    {'arabic': 'الْحَمِيدُ', 'name': 'Al-Hamid', 'meaning': 'The Praiseworthy'},
    {'arabic': 'الْمُحْصِي', 'name': 'Al-Muhsi', 'meaning': 'The Accounter'},
    {'arabic': 'الْمُبْدِئُ', 'name': 'Al-Mubdi', 'meaning': 'The Originator'},
    {'arabic': 'الْمُعِيدُ', 'name': 'Al-Muid', 'meaning': 'The Restorer'},
    {'arabic': 'الْمُحْيِي', 'name': 'Al-Muhyi', 'meaning': 'The Giver of Life'},
    {'arabic': 'الْمُمِيتُ', 'name': 'Al-Mumit', 'meaning': 'The Bringer of Death'},
    {'arabic': 'الْحَيُّ', 'name': 'Al-Hayy', 'meaning': 'The Ever-Living'},
    {'arabic': 'الْقَيُّومُ', 'name': 'Al-Qayyum', 'meaning': 'The Self-Subsisting'},
    {'arabic': 'الْوَاجِدُ', 'name': 'Al-Wajid', 'meaning': 'The Finder'},
    {'arabic': 'الْمَاجِدُ', 'name': 'Al-Majid', 'meaning': 'The Noble'},
    {'arabic': 'الْوَاحِدُ', 'name': 'Al-Wahid', 'meaning': 'The One'},
    {'arabic': 'الصَّمَدُ', 'name': 'As-Samad', 'meaning': 'The Eternal Refuge'},
    {'arabic': 'الْقَادِرُ', 'name': 'Al-Qadir', 'meaning': 'The All-Powerful'},
    {'arabic': 'الْمُقْتَدِرُ', 'name': 'Al-Muqtadir', 'meaning': 'The All-Determining'},
    {'arabic': 'الْمُقَدِّمُ', 'name': 'Al-Muqaddim', 'meaning': 'The Expediter'},
    {'arabic': 'الْمُؤَخِّرُ', 'name': 'Al-Muakhkhir', 'meaning': 'The Delayer'},
    {'arabic': 'الْأَوَّلُ', 'name': 'Al-Awwal', 'meaning': 'The First'},
    {'arabic': 'الْآخِرُ', 'name': 'Al-Akhir', 'meaning': 'The Last'},
    {'arabic': 'الظَّاهِرُ', 'name': 'Az-Zahir', 'meaning': 'The Manifest'},
    {'arabic': 'الْبَاطِنُ', 'name': 'Al-Batin', 'meaning': 'The Hidden'},
    {'arabic': 'الْوَالِي', 'name': 'Al-Wali', 'meaning': 'The Governor'},
    {'arabic': 'الْمُتَعَالِي', 'name': 'Al-Mutaali', 'meaning': 'The Most Exalted'},
    {'arabic': 'الْبَرُّ', 'name': 'Al-Barr', 'meaning': 'The Source of Goodness'},
    {'arabic': 'التَّوَّابُ', 'name': 'At-Tawwab', 'meaning': 'The Acceptor of Repentance'},
    {'arabic': 'الْمُنْتَقِمُ', 'name': 'Al-Muntaqim', 'meaning': 'The Avenger'},
    {'arabic': 'الْعَفُوُّ', 'name': 'Al-Afuww', 'meaning': 'The Pardoner'},
    {'arabic': 'الرَّؤُوفُ', 'name': 'Ar-Rauf', 'meaning': 'The Most Kind'},
    {'arabic': 'مَالِكُ الْمُلْكِ', 'name': 'Malik-ul-Mulk', 'meaning': 'Owner of Sovereignty'},
    {'arabic': 'ذُو الْجَلَالِ وَالْإِكْرَامِ', 'name': 'Dhul-Jalali wal-Ikram', 'meaning': 'Lord of Majesty and Honor'},
    {'arabic': 'الْمُقْسِطُ', 'name': 'Al-Muqsit', 'meaning': 'The Equitable'},
    {'arabic': 'الْجَامِعُ', 'name': 'Al-Jami', 'meaning': 'The Gatherer'},
    {'arabic': 'الْغَنِيُّ', 'name': 'Al-Ghani', 'meaning': 'The Self-Sufficient'},
    {'arabic': 'الْمُغْنِي', 'name': 'Al-Mughni', 'meaning': 'The Enricher'},
    {'arabic': 'الْمَانِعُ', 'name': 'Al-Mani', 'meaning': 'The Preventer'},
    {'arabic': 'الضَّارُّ', 'name': 'Ad-Darr', 'meaning': 'The Distresser'},
    {'arabic': 'النَّافِعُ', 'name': 'An-Nafi', 'meaning': 'The Benefactor'},
    {'arabic': 'النُّورُ', 'name': 'An-Nur', 'meaning': 'The Light'},
    {'arabic': 'الْهَادِي', 'name': 'Al-Hadi', 'meaning': 'The Guide'},
    {'arabic': 'الْبَدِيعُ', 'name': 'Al-Badi', 'meaning': 'The Incomparable Originator'},
    {'arabic': 'الْبَاقِي', 'name': 'Al-Baqi', 'meaning': 'The Everlasting'},
    {'arabic': 'الْوَارِثُ', 'name': 'Al-Warith', 'meaning': 'The Inheritor'},
    {'arabic': 'الرَّشِيدُ', 'name': 'Ar-Rashid', 'meaning': 'The Guide to the Right Path'},
    {'arabic': 'الصَّبُورُ', 'name': 'As-Sabur', 'meaning': 'The Patient'},
  ];

  String searchText = '';

  @override
  void dispose() { //remove state of statefull widget permanently
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Search ke mutabiq names filter honge
    final filteredNames = names.where((item) {
      final query = searchText.toLowerCase();

      return item['name']!.toLowerCase().contains(query) ||
          item['meaning']!.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF3F7F5),

      appBar: AppBar(
        title: const Text(
          '99 Names of Allah',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF145A50),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: Column(
        children: [
          // Beautiful top banner
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: const Color(0xFF145A50),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              children: [
                Text(
                  'أَسْمَاءُ اللَّهِ الْحُسْنَى',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'The 99 Beautiful Names of Allah',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Learn and remember the beautiful names',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          // Search field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search name or meaning...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Total names count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Showing ${filteredNames.length} of 99 Names',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF145A50),
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Names grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: filteredNames.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.95,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                final item = filteredNames[index];

                // Original number in the complete list
                final originalIndex = names.indexOf(item) + 1;

                return Card(
                  elevation: 2,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(
                      color: Color(0xFFD5E7E1),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Number
                        Text(
                          originalIndex.toString().padLeft(2, '0'),
                          style: const TextStyle(
                            color: Color(0xFF9A8050),
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        // Arabic name
                        Text(
                          item['arabic']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 25,
                            color: Color(0xFF145A50),
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        // English name
                        Text(
                          item['name']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color(0xFF145A50),
                          ),
                        ),

                        const SizedBox(height: 5),

                        // Meaning
                        Text(
                          item['meaning']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
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
