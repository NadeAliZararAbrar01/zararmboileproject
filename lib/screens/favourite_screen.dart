
import 'package:flutter/material.dart';


import 'package:flutter/material.dart';

import 'FavouriteAazkar.dart';
import 'azkar_screen.dart';
import 'favorite_azkar_store.dart';

// Favourite Screen
class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Azkar'),
        backgroundColor: Colors.teal[700],
        foregroundColor: Colors.white,
      ),

      body: AnimatedBuilder(
        animation: FavoriteAzkarStore.instance,

        builder: (context, child) {

          // Get favourite Azkar
          final favourites = azkarList.where((azkar) {
            final key = '${azkar.title}|${azkar.arabic}';

            return FavoriteAzkarStore.instance.isFavorite(key);
          }).toList();

          // If no favourite Azkar
          if (favourites.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 65,
                    color: Colors.grey,
                  ),

                  SizedBox(height: 12),

                  Text(
                    'No Favourite Azkar Yet',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 6),

                  Text(
                    'Add Azkar using the heart icon.',
                  ),
                ],
              ),
            );
          }

          // Display favourite Azkar
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: favourites.length,

            itemBuilder: (context, index) {
              final azkar = favourites[index];

              final key = '${azkar.title}|${azkar.arabic}';

              return Card(
                margin: const EdgeInsets.only(bottom: 14),

                child: Padding(
                  padding: const EdgeInsets.all(16),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,

                    children: [

                      // Title and Remove Favourite Button
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${azkar.title} Azkar',
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                              ),
                            ),
                          ),

                          IconButton(
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),

                            tooltip: 'Remove Favourite',

                            onPressed: () {
                              FavoriteAzkarStore.instance
                                  .toggleFavorite(key);
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // Arabic Text
                      Text(
                        azkar.arabic,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          fontSize: 23,
                          height: 2,
                        ),
                      ),

                      const Divider(height: 25),

                      // Transliteration
                      const Text(
                        'Transliteration',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(azkar.transliteration),

                      const SizedBox(height: 14),

                      // Urdu Translation
                      const Text(
                        'Urdu Translation',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        azkar.urdu,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                      ),

                      const SizedBox(height: 12),

                      // Target Count
                      Text(
                        'Target: ${azkar.targetCount} times',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
