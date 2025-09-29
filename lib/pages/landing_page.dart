import 'package:flutter/material.dart';
import '../widgets/gradient_button.dart';

class LandingPage extends StatelessWidget {
  final void Function(int) onChangePage;

  LandingPage({super.key, required this.onChangePage});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final bool isDesktop = constraints.maxWidth > 800;
      return SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: isDesktop ? 420 : 260,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/fondo.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: isDesktop ? 420 : 260,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.35),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: isDesktop ? 48 : 24,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "🌿 Bienvenido a EcoTurismo",
                        style: TextStyle(
                          fontSize: isDesktop ? 34 : 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          shadows: const [Shadow(blurRadius: 6, color: Colors.black45, offset: Offset(1.5, 1.5))],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Descubre aves exóticas y reservas naturales únicas.",
                        style: TextStyle(fontSize: isDesktop ? 16 : 13, color: Colors.white70),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          GradientButton(
                            text: "Ver Catálogo",
                            gradient: const LinearGradient(colors: [Color(0xFF8EE3B1), Color(0xFF45B26B)]),
                            onTap: () => onChangePage(1),
                          ),
                          const SizedBox(width: 12),
                          GradientButton(
                            text: "Reservas",
                            gradient: const LinearGradient(colors: [Color(0xFFF6E3D6), Color(0xFFFFCDA3)]),
                            onTap: () => onChangePage(3),
                            minWidth: 140,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 18,
                runSpacing: 18,
                alignment: WrapAlignment.center,
                children: [
                  _featureIcon(Icons.flutter_dash, "Flutter"),
                  _featureIcon(Icons.android, "Android"),
                  _featureIcon(Icons.apple, "iOS"),
                  _featureIcon(Icons.web, "Web"),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  "assets/images/fondo2.jpg",
                  height: isDesktop ? 300 : 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 36),
          ],
        ),
      );
    });
  }

  Widget _featureIcon(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(radius: 26, backgroundColor: const Color(0xFFDFF7EA), child: Icon(icon, size: 28, color: const Color(0xFF1B5E20))),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 13, color: Colors.black87)),
      ],
    );
  }
}
