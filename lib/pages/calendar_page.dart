// calendar_page.dart
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 🎨 Colores base
    const Color bgPastel = Color(0xFFF6FFEF); // Fondo suave
    const Color accentGreen = Color(0xFF3C8A1F); // Verde principal
    const double pageHorizontalPadding = 28;

    return Scaffold(
      backgroundColor: bgPastel,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: pageHorizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 18),

                // 🔹 Header con título y línea decorativa
                Text(
                  "Calendario Global de Avistamientos y Festivales",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  height: 6,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: accentGreen.withOpacity(0.18),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: FractionallySizedBox(
                      widthFactor: 0.18,
                      child: Container(height: 6, color: accentGreen),
                    ),
                  ),
                ),
                const SizedBox(height: 22),

                // 🔹 Card principal con Tabs
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: const [
                      BoxShadow(color: Color(0x22000000), blurRadius: 14, offset: Offset(0, 8))
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: DefaultTabController(
                      length: 3,
                      child: Column(
                        children: [
                          // 🔹 TabBar
                          TabBar(
                            isScrollable: true,
                            indicator: BoxDecoration(
                              color: const Color(0xFFDFF5C9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelColor: accentGreen,
                            unselectedLabelColor: Colors.grey[800],
                            labelStyle: GoogleFonts.montserrat(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                            tabs: const [
                              Tab(text: "1. Temporadas de Migración"),
                              Tab(text: "2. Avistamientos Mensuales"),
                              Tab(text: "3. Festivales y Conteo"),
                            ],
                          ),

                          const Divider(height: 1),

                          // 🔹 TabBarView (contenido de cada sección)
                          SizedBox(
                            height: 650, // altura fija con scroll interno
                            child: TabBarView(
                              children: [
                                _temporadasTab(accentGreen),
                                _avistamientosTab(accentGreen),
                                _festivalesTab(accentGreen),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ----------- TAB 1: Temporadas de Migración -----------
  static Widget _temporadasTab(Color accentGreen) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Temporadas Clave de Movimiento de Aves",
            style: GoogleFonts.montserrat(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: accentGreen,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "El hemisferio occidental experimenta dos grandes picos migratorios. Conocerlos es esencial para planificar una expedición de aviturismo.",
            style: GoogleFonts.openSans(fontSize: 15, color: Colors.grey[800], height: 1.5),
          ),
          const SizedBox(height: 22),

          // 🔹 Tarjetas lado a lado
          Expanded(
            child: ListView(
              children: [
                _seasonCard(
                  title: "Migración de Otoño (Boreal)",
                  period: "Finales de Agosto a Noviembre",
                  bullets: [
                    "Rapaces (Veracruz, Panamá), Playeros (Costas Caribeñas), Paseriformes.",
                    "Las aves dejan Norteamérica y llegan a Centro y Sudamérica (invernada).",
                    "Conteo masivo de aves de presa y llegada de chipes.",
                  ],
                  bgColor: const Color(0xFFFFF6E6),
                  sideColor: const Color(0xFFF2B84B),
                  icon: Icons.arrow_downward,
                ),
                const SizedBox(height: 16),
                _seasonCard(
                  title: "Migración de Primavera (Boreal)",
                  period: "Finales de Febrero a Mayo",
                  bullets: [
                    "Colibríes, Tangaras, Patos y Ocas, aves con plumaje de cría.",
                    "Las aves regresan a sus sitios de anidación en Norteamérica.",
                    "Observar aves con plumaje nupcial y canto activo.",
                  ],
                  bgColor: const Color(0xFFEFF8FF),
                  sideColor: const Color(0xFF4EA1F0),
                  icon: Icons.arrow_upward,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ----------- TAB 2: Avistamientos Mensuales -----------
  static Widget _avistamientosTab(Color accentGreen) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Avistamientos Mensuales Destacados",
            style: GoogleFonts.montserrat(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: accentGreen,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                _monthCard("Enero", "Pelícanos y aves acuáticas en lagunas."),
                _monthCard("Marzo", "Inicio de llegada de colibríes."),
                _monthCard("Mayo", "Aves playeras en migración norte."),
                _monthCard("Agosto", "Rapaces comienzan su travesía."),
                _monthCard("Octubre", "Chipes y tangaras en abundancia."),
                _monthCard("Diciembre", "Especies invernantes asentadas."),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ----------- TAB 3: Festivales y Conteo -----------
  static Widget _festivalesTab(Color accentGreen) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Festivales y Conteo Ciudadano",
            style: GoogleFonts.montserrat(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: accentGreen,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              children: [
                _festivalTile("Festival de Aves Rapaces", "Veracruz, México", "Septiembre"),
                _festivalTile("Día Mundial de las Aves Migratorias", "Global", "Mayo y Octubre"),
                _festivalTile("Conteo Navideño de Aves", "Américas", "Diciembre - Enero"),
                _festivalTile("Festival del Colibrí", "Costa Rica", "Marzo"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ----------- Widgets Reusables -----------

  static Widget _seasonCard({
    required String title,
    required String period,
    required List<String> bullets,
    required Color bgColor,
    required Color sideColor,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Color(0x11000000), blurRadius: 8, offset: Offset(0, 6))],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 8,
            height: 160,
            decoration: BoxDecoration(
              color: sideColor,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Icon(icon, color: sideColor, size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(title, style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w800)),
                    )
                  ]),
                  const SizedBox(height: 8),
                  Text("Período: $period", style: GoogleFonts.openSans(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: bullets
                        .map((b) => Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Text("• $b", style: GoogleFonts.openSans(fontSize: 14)),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  static Widget _monthCard(String month, String desc) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF7FAFF),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Color(0x11000000), blurRadius: 6, offset: Offset(0, 4))],
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(month, style: GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.w800)),
          const SizedBox(height: 6),
          Text(desc, style: GoogleFonts.openSans(fontSize: 13, color: Colors.grey[700])),
        ],
      ),
    );
  }

  static Widget _festivalTile(String title, String place, String date) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8EE),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Color(0x11000000), blurRadius: 6, offset: Offset(0, 4))],
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.w800)),
          Text(place, style: GoogleFonts.openSans(fontSize: 13, color: Colors.grey[700])),
          const SizedBox(height: 4),
          Text(date, style: GoogleFonts.montserrat(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.deepOrange)),
        ],
      ),
    );
  }
}
