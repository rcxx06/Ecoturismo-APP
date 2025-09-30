import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModuloEducativoPage extends StatelessWidget {
  const ModuloEducativoPage({Key? key}) : super(key: key);

  // Paleta principal
  static const Color bg = Color(0xFFF4FBEB); 
  static const Color green = Color(0xFF4E9B12); 
  static const Color deepGreen = Color(0xFF2F6F0B);

  final List<_CardData> cards = const [
    _CardData(
      title: '1. No Alterar la Dieta Natural',
      body:
          'Evita alimentar directamente a las aves. La comida humana o inapropiada crea dependencia y puede generar congregaciones peligrosas.',
      icon: Icons.no_food,
    ),
    _CardData(
      title: '2. Mantener Basura Cero',
      body:
          'Lleva contigo todos tus desechos. Los residuos, especialmente el plástico, son una causa principal de muerte y desorientación.',
      icon: Icons.delete_outline,
    ),
    _CardData(
      title: '3. Observación a Distancia Segura',
      body:
          'Utiliza binoculares y telescopios. Nunca te acerques a nidos o polluelos para evitar el abandono o fracaso reproductivo.',
      icon: Icons.remove_red_eye_outlined,
    ),
    _CardData(
      title: '4. Uso Responsable del Sonido',
      body:
          'Minimiza el uso de grabaciones o la técnica de "pishing". El uso excesivo causa estrés y puede exponer a depredadores.',
      icon: Icons.volume_up,
    ),
    _CardData(
      title: '5. Apoyar la Flora Nativa',
      body:
          'Planta especies locales. Proporcionan alimento y refugio que las aves migratorias necesitan para reabastecerse.',
      icon: Icons.park,
    ),
    _CardData(
      title: '6. Controlar Mascotas (Gatos/Perros)',
      body:
          'Los gatos domésticos son una amenaza masiva. Mantén tus mascotas dentro o bajo supervisión si vives cerca de rutas de vuelo.',
      icon: Icons.pets,
    ),
    _CardData(
      title: '7. Contribuir a la Ciencia Ciudadana',
      body:
          'Participa en conteos como Global Big Day o Christmas Bird Count: tus datos ayudan a planificar estrategias de conservación.',
      icon: Icons.bar_chart,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        title: Text(
          'Módulo Educativo',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,
            color: deepGreen,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),

            // --- Header con título grande y subrayado ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Text(
                    'Guardianes de la Ruta Migratoria',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 34,
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                      height: 1.05,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 6,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: green.withOpacity(0.18),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: FractionallySizedBox(
                        widthFactor: 0.22,
                        child: Container(
                          height: 6,
                          decoration: BoxDecoration(
                            color: green,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Nuestro compromiso es proteger los corredores vitales de las aves. Aprende las prácticas que aseguran un futuro para estas viajeras incansables.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // --- Caja verde (70% biodiversidad) ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                decoration: BoxDecoration(
                  color: green,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.08),
                      blurRadius: 14,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          )
                        ],
                      ),
                      child: const Icon(
                        Icons.eco,
                        color: green,
                        size: 38,
                      ),
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: Text(
                        'El 70% de la biodiversidad aviar depende de estas rutas. ¡Tu acción es su supervivencia!',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 36),

            // --- Subtítulo ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '7 Prácticas Esenciales para la Conservación',
                  style: GoogleFonts.montserrat(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 18),

            // --- Grid de tarjetas ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;
                  int columns = 1;
                  if (width > 1100) {
                    columns = 3;
                  } else if (width > 700) {
                    columns = 2;
                  }

                  return Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: cards
                        .map((c) => SizedBox(
                              width: (width - (20 * (columns - 1))) / columns,
                              child: _EduCard(data: c),
                            ))
                        .toList(),
                  );
                },
              ),
            ),

            const SizedBox(height: 28),

            // --- Footer con stripe ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(46, 125, 50, 0.08),
                      blurRadius: 18,
                      offset: Offset(0, 8),
                    )
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 12,
                      height: 130,
                      decoration: const BoxDecoration(
                        color: deepGreen,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '7. Contribuir a la Ciencia Ciudadana',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w800, fontSize: 18),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Participa en conteos de aves como el Global Big Day o el Christmas Bird Count. Tus datos son esenciales para que los científicos rastreen las poblaciones y planifiquen estrategias de conservación.',
                              style: GoogleFonts.openSans(
                                  fontSize: 14, color: Colors.black54, height: 1.4),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

/// Datos de tarjeta
class _CardData {
  final String title;
  final String body;
  final IconData icon;
  const _CardData({
    required this.title,
    required this.body,
    required this.icon,
  });
}

/// Tarjeta individual
class _EduCard extends StatelessWidget {
  final _CardData data;
  const _EduCard({required this.data, Key? key}) : super(key: key);

  static const Color stripe = Color(0xFF2F6F0B);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(46, 125, 50, 0.06),
            blurRadius: 12,
            offset: Offset(0, 6),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 8),
            width: 12,
            height: 130,
            decoration: const BoxDecoration(
              color: stripe,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF1F7F1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(data.icon, color: stripe, size: 24),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          data.title,
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    data.body,
                    style: GoogleFonts.openSans(
                      fontSize: 13,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
