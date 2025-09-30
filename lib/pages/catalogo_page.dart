import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CatalogoPage extends StatefulWidget {
  const CatalogoPage({super.key});

  @override
  State<CatalogoPage> createState() => _CatalogoPageState();
}

class _CatalogoPageState extends State<CatalogoPage> {
  final List<Map<String, dynamic>> menuItems = [
    {"title": "Inicio", "icon": Icons.home},
    {"title": "Información", "icon": Icons.info},
    {"title": "Rutas Migratorias", "icon": Icons.alt_route},
    {"title": "Especies", "icon": Icons.list_alt},
  ];

  final List<Map<String, String>> aves = [
    {
      "nombre": "Playero Rojizo",
      "cientifico": "Calidris canutus",
      "estatus": "Preocupación Menor",
      "alimentacion": "Moluscos y pequeños crustáceos",
      "zona": "América del Norte",
      "foto": "assets/images/playero.jpeg"
    },
    {
      "nombre": "Reinita Amarilla",
      "cientifico": "Setophaga petechia",
      "estatus": "Preocupación Menor",
      "alimentacion": "Larvas e insectos pequeños",
      "zona": "Norteamérica / Migración Austral",
      "foto": "assets/images/reinitaAmarilla.jpeg"
    },
    {
      "nombre": "Tangara Escarlata",
      "cientifico": "Piranga olivacea",
      "estatus": "Preocupación Menor",
      "alimentacion": "Frutas e insectos",
      "zona": "Bosques tropicales",
      "foto": "assets/images/Tangara.jpeg"
    },
  ];

  int selectedAveIndex = 1; // 🔹 Reinita Amarilla por defecto
  int selectedMenuIndex = 3; // 🔹 "Especies" por defecto

  @override
  Widget build(BuildContext context) {
    final ave = aves[selectedAveIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          // 🔹 Sidebar izquierda (azul pastel con directorio)
          Container(
            width: 280,
            decoration: const BoxDecoration(
              color: Color(0xFFF0F8FF),
              boxShadow: [
                BoxShadow(
                  color: Color(0x22000000),
                  blurRadius: 4,
                  offset: Offset(2, 0),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Encabezado
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Text(
                    "DIRECTORIO AÉREO",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
                // 🔹 Opciones principales
                ...List.generate(menuItems.length, (index) {
                  final item = menuItems[index];
                  final isSelected = selectedMenuIndex == index;

                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedMenuIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFEDE7F6)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(item["icon"] as IconData,
                              size: 18,
                              color: isSelected
                                  ? Colors.deepPurple
                                  : Colors.black87),
                          const SizedBox(width: 10),
                          Text(
                            item["title"] as String,
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                              color: isSelected
                                  ? Colors.deepPurple
                                  : Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),

                const Divider(height: 30, thickness: 1),

                // 🔹 Lista de aves (solo visible en "Especies")
                if (selectedMenuIndex == 3)
                  Expanded(
                    child: ListView.builder(
                      itemCount: aves.length,
                      itemBuilder: (context, index) {
                        final item = aves[index];
                        final isSelected = index == selectedAveIndex;

                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFFEDE7F6)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            title: Text(
                              item["nombre"] ?? '',
                              style: TextStyle(
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.w500,
                                fontSize: 15,
                                color: isSelected
                                    ? Colors.deepPurple
                                    : Colors.black87,
                              ),
                            ),
                            subtitle: Text(
                              item["cientifico"] ?? '',
                              style: TextStyle(
                                fontSize: 12,
                                color: isSelected
                                    ? Colors.deepPurple.shade300
                                    : Colors.grey,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                selectedAveIndex = index;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),

          // 🔹 Panel principal
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Imagen + nombre
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.asset(
                          ave["foto"] ?? '',
                          height: 320,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 12,
                        left: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ave["nombre"] ?? '',
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                ave["cientifico"] ?? '',
                                style: GoogleFonts.montserrat(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Tarjetas de información
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      _infoCard(
                        "ESTATUS DE CONSERVACIÓN",
                        ave["estatus"] ?? '',
                        Colors.green.shade50,
                        Colors.green,
                      ),
                      _infoCard(
                        "ALIMENTACIÓN PRINCIPAL",
                        ave["alimentacion"] ?? '',
                        Colors.yellow.shade50,
                        Colors.orange.shade800,
                      ),
                      _infoCard(
                        "ZONA CLAVE DE INVERNADA",
                        ave["zona"] ?? '',
                        Colors.teal.shade50,
                        Colors.teal.shade700,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // 🔹 Subtítulo Rutas Migratorias
                  Text(
                    "RUTAS MIGRATORIAS",
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Ejemplo de rutas migratorias
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      _rutaCard("Ruta Norteamérica", "assets/images/rutaTangara.png"),
                      _rutaCard("Ruta Centroamérica", "assets/images/rutaPlayero.jpg"),
                      
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Card de info
  Widget _infoCard(
      String title, String value, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 6,
            offset: Offset(0, 3),
          )
        ],
      ),
      width: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: textColor,
              )),
          const SizedBox(height: 10),
          Text(
            value,
            style: GoogleFonts.montserrat(
              fontSize: 14,
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Card de rutas
  Widget _rutaCard(String title, String imagePath) {
    return Container(
      width: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 6,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(14)),
            child: Image.asset(
              imagePath,
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(14)),
            ),
            child: Text(
              title,
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
