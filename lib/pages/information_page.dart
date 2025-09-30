
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

class InformacionPage extends StatelessWidget {
  const InformacionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> reserves = [
      // ----- Muchas reservas de Nicaragua -----
      {
        'color': Colors.green.shade700,
        'icon': Icons.park,
        'country': 'Nicaragua',
        'subtitle': 'Bosque Seco / Húmedo',
        'title': 'Reserva Natural Montibelli',
        'location': 'Managua',
        'focus': 'Chipe Alidorada, Chipe Gorjinaranja, Colibríes',
        'activities': 'Aviturismo guiado',
      },
      {
        'color': Colors.teal.shade700,
        'icon': Icons.terrain,
        'country': 'Nicaragua',
        'subtitle': 'Volcán / Bosque Tropical',
        'title': 'Reserva Natural Volcán Mombacho',
        'location': 'Granada',
        'focus': 'Quetzales, colibríes, bromelias',
        'activities': 'Senderismo, canopy, observación',
      },
      {
        'color': Colors.orange.shade700,
        'icon': Icons.whatshot,
        'country': 'Nicaragua',
        'subtitle': 'Volcán',
        'title': 'Cerro Negro',
        'location': 'León',
        'focus': 'Aves de páramo y aves rupícolas',
        'activities': 'Volcano boarding, trekking',
      },
      {
        'color': Colors.blue.shade700,
        'icon': Icons.water,
        'country': 'Nicaragua',
        'subtitle': 'Lago / Isla',
        'title': 'Isla de Ometepe (Reserva y Paisaje)',
        'location': 'Lago Cocibolca - Rivas',
        'focus': 'Aves lacustres, aves forestales endémicas',
        'activities': 'Avistamiento, kayak, senderismo',
      },
      {
        'color': Colors.cyan.shade700,
        'icon': Icons.beach_access,
        'country': 'Nicaragua',
        'subtitle': 'Isla / Costa Caribe',
        'title': 'Cayos Miskitos',
        'location': 'Caribe Norte',
        'focus': 'Aves costeras, fauna marina',
        'activities': 'Paseos en bote, snorkeling, observación',
      },
      {
        'color': Colors.lime.shade800,
        'icon': Icons.nature_people,
        'country': 'Nicaragua',
        'subtitle': 'Bosque Montano',
        'title': 'Reserva Natural Miraflor',
        'location': 'Estelí',
        'focus': 'Reinitas, tangaras, colibríes',
        'activities': 'Senderismo, visitas a comunidades',
      },
      {
        'color': Colors.indigo.shade700,
        'icon': Icons.eco,
        'country': 'Nicaragua',
        'subtitle': 'Humedal / Manglar',
        'title': 'Isla Juan Venado',
        'location': 'León',
        'focus': 'Aves acuáticas y migratorias',
        'activities': 'Recorridos en bote por manglares',
      },
      {
        'color': Colors.green.shade900,
        'icon': Icons.biotech,
        'country': 'Nicaragua',
        'subtitle': 'Biosfera / Selva',
        'title': 'Bosawás (Reserva de la Biosfera)',
        'location': 'Norte',
        'focus': 'Alta diversidad, endemismos',
        'activities': 'Observación de fauna en selva primaria',
      },
      {
        'color': Colors.deepOrange.shade600,
        'icon': Icons.water_drop,
        'country': 'Nicaragua',
        'subtitle': 'Laguna Volcánica',
        'title': 'Laguna de Apoyo (Reserva Natural)',
        'location': 'Masaya / Granada',
        'focus': 'Aves lacustres, fauna acuática',
        'activities': 'Kayak, observación y turismo comunitario',
      },
      {
        'color': Colors.brown.shade600,
        'icon': Icons.eco_outlined,
        'country': 'Nicaragua',
        'subtitle': 'Selva / Costa Sur',
        'title': 'Reserva Biológica Indio Maíz',
        'location': 'Río San Juan',
        'focus': 'Aves amazónicas, migratorias y endémicas',
        'activities': 'Aviturismo profundo, expediciones',
      },
      {
        'color': Colors.blueGrey.shade700,
        'icon': Icons.grass,
        'country': 'Nicaragua',
        'subtitle': 'Humedal Costero',
        'title': 'Estero Real (Refugio Natural)',
        'location': 'Chinandega',
        'focus': 'Aves playeras, manglares',
        'activities': 'Paseos en lancha y observación',
      },

      // ----- Otras reservas internacionales (mantengo las anteriores) -----
      {
        'color': Colors.blue.shade600,
        'icon': Icons.cloud,
        'country': 'Costa Rica',
        'subtitle': 'Bosque Nuboso',
        'title': 'Bosque Nuboso Monteverde',
        'location': 'Puntarenas',
        'focus': 'Quetzal Resplandeciente, colibríes, tangaras',
        'activities': 'Observación de quetzal',
      },
      {
        'color': Colors.brown.shade600,
        'icon': Icons.account_balance,
        'country': 'Guatemala',
        'subtitle': 'Selva / Sitio Arqueológico',
        'title': 'Reserva Natural Tikal',
        'location': 'Petén',
        'focus': 'Pavo ocelado, aves de sotobosque',
        'activities': 'Recorridos arqueológicos y avistamiento',
      },
      {
        'color': Colors.indigo.shade600,
        'icon': Icons.terrain,
        'country': 'Chile',
        'subtitle': 'Patagonia / Migración',
        'title': 'Parque Nacional Torres del Paine',
        'location': 'Magallanes',
        'focus': 'Aves migratorias, aves acuáticas',
        'activities': 'Trekking y observación',
      },
      {
        'color': Colors.teal.shade600,
        'icon': Icons.eco,
        'country': 'Perú',
        'subtitle': 'Amazonía',
        'title': 'Parque Nacional del Manu',
        'location': 'Madre de Dios',
        'focus': 'Alta diversidad amazónica',
        'activities': 'Observación en selva profunda',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Información',
          style: GoogleFonts.playfairDisplay(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: reserves.length,
        itemBuilder: (context, index) {
          final r = reserves[index];
          return _buildReservaCard(
            context,
            color: r['color'] as Color,
            icono: r['icon'] as IconData,
            pais: r['country'] as String,
            subtitulo: r['subtitle'] as String,
            titulo: r['title'] as String,
            ubicacion: r['location'] as String,
            focus: r['focus'] as String,
            actividades: r['activities'] as String,
          );
        },
      ),
    );
  }

  Widget _buildReservaCard(
    BuildContext context, {
    required Color color,
    required IconData icono,
    required String pais,
    required String subtitulo,
    required String titulo,
    required String ubicacion,
    required String focus,
    required String actividades,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 8,
      shadowColor: Colors.black26,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Encabezado colorido con icono redondo
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white.withOpacity(0.18),
                  child: Icon(icono, color: Colors.white, size: 30),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pais,
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitulo,
                      style: GoogleFonts.openSans(
                        fontSize: 13,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Contenido
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  ubicacion,
                  style: GoogleFonts.openSans(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.center_focus_strong, size: 20, color: color),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Focus: $focus',
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.directions_walk, size: 20, color: color),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Actividades: $actividades',
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Botón "Ver info completa"
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(18)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () {
                  // Puedes redirigir a una página de detalle aquí
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Abrir: $titulo')),
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: color,
                ),
                icon: const Icon(Icons.arrow_forward),
                label: Text(
                  'Ver info completa',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
