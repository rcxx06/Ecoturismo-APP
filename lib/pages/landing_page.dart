import 'package:flutter/material.dart';
import '../widgets/gradient_button.dart';

class LandingPage extends StatelessWidget {
  final void Function(int) onChangePage;

  const LandingPage({super.key, required this.onChangePage});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isDesktop = constraints.maxWidth > 800;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ---------------- Hero principal ----------------
              Stack(
                children: [
                  Container(
                    height: isDesktop ? 480 : 320,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/image1.jpeg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: isDesktop ? 480 : 320,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.55),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: isDesktop ? 80 : 40,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 600),
                          style: TextStyle(
                            fontSize: isDesktop ? 40 : 26,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: const [
                              Shadow(
                                blurRadius: 10,
                                color: Colors.black54,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: const Text("🌿 Explora Global Wings"),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Vive una experiencia única entre aves exóticas y reservas naturales.",
                          style: TextStyle(
                            fontSize: isDesktop ? 18 : 14,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            GradientButton(
                              text: "Ver Catálogo",
                              gradient: const LinearGradient(
                                colors: [Color(0xFF8EE3B1), Color(0xFF45B26B)],
                              ),
                              onTap: () => onChangePage(1),
                            ),
                            const SizedBox(width: 14),
                            GradientButton(
                              text: "Reservar Ahora",
                              gradient: const LinearGradient(
                                colors: [Color(0xFFF6E3D6), Color(0xFFFFCDA3)],
                              ),
                              onTap: () => onChangePage(3),
                              minWidth: 150,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // ---------------- Sección de características ----------------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildFeatureCard(Icons.eco, "Turismo Responsable",
                        "Conectamos naturaleza y sostenibilidad."),
                    _buildFeatureCard(Icons.flight_takeoff, "Fácil Acceso",
                        "Encuentra tours y reservas en segundos."),
                    _buildFeatureCard(Icons.spa, "Bienestar Natural",
                        "Explora y relájate en entornos únicos."),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              // ---------------- Imagen inspiradora ----------------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/image1.jpeg",
                        height: isDesktop ? 340 : 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        height: isDesktop ? 340 : 200,
                        alignment: Alignment.center,
                        color: Colors.black26,
                        child: Text(
                          "🌎 Conéctate con la naturaleza",
                          style: TextStyle(
                            fontSize: isDesktop ? 26 : 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            shadows: const [
                              Shadow(
                                blurRadius: 8,
                                color: Colors.black87,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 60),
            ],
          ),
        );
      },
    );
  }

  // ------- Widget para tarjetas de características -------
  Widget _buildFeatureCard(IconData icon, String title, String description) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: const Color(0xFFDFF7EA),
            child: Icon(icon, size: 30, color: const Color(0xFF1B5E20)),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
