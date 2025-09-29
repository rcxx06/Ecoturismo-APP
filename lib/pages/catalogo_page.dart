import 'package:flutter/material.dart';
import '../widgets/bird_card.dart';

class CatalogoPage extends StatelessWidget {
  CatalogoPage({super.key});

  final List<Map<String, String>> aves = [
    {"nombre": "Quetzal", "tipo": "Endémica", "foto": "assets/images/quetzal.jpg"},
    {"nombre": "Colibrí", "tipo": "Migratoria", "foto": "assets/images/colibri.jpg"},
    {"nombre": "Garza Blanca", "tipo": "Endémica", "foto": "assets/images/garza.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      int crossAxisCount = 2;
      if (constraints.maxWidth > 1200) crossAxisCount = 4;
      else if (constraints.maxWidth > 800) crossAxisCount = 3;

      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF6FEF6),
                borderRadius: BorderRadius.circular(14),
                boxShadow: const [BoxShadow(color: Color(0x11000000), blurRadius: 6, offset: Offset(0, 3))],
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Buscar ave...",
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.78,
              ),
              itemCount: aves.length,
              itemBuilder: (context, index) {
                final ave = aves[index];
                return BirdCard(
                  name: ave['nombre'] ?? '',
                  type: ave['tipo'] ?? '',
                  imageUrl: ave['foto'] ?? '',
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
