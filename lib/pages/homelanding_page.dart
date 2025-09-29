import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'catalogo_page.dart';
import 'educativo_page.dart';
import 'contact_page.dart';
import 'profile_page.dart';

class HomeLandingPage extends StatefulWidget {
  const HomeLandingPage({super.key});

  @override
  State<HomeLandingPage> createState() => _HomeLandingPageState();
}

class _HomeLandingPageState extends State<HomeLandingPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      _buildLanding(context),
      CatalogoPage(),
      const ModuloEducativoPage(),
      const ContactPage(),
      ProfilePage(),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Fondo
          Positioned.fill(
            child: Image.asset(
              "assets/images/aves-migratorias.jpg",
              fit: BoxFit.cover,
            ),
          ),
          // Overlay oscuro
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.55)),
          ),
          // Contenido
          SafeArea(
            child: Column(
              children: [
                // 🔹 Barra superior estilo web
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _menuItem("Inicio", 0),
                      const SizedBox(width: 26),
                      _menuItem("Catálogo", 1),
                      const SizedBox(width: 26),
                      _menuItem("Educativo", 2),
                      const SizedBox(width: 26),
                      _menuItem("Contactos", 3),
                      const SizedBox(width: 26),
                      _menuItem("Perfil", 4),
                    ],
                  ),
                ),

                // Contenido dinámico
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (child, animation) {
                      final inAnim = Tween<Offset>(
                        begin: const Offset(0.0, 0.1),
                        end: Offset.zero,
                      ).animate(animation);
                      return FadeTransition(
                        opacity: animation,
                        child: SlideTransition(position: inAnim, child: child),
                      );
                    },
                    child: pages[currentIndex],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
// ---------- Hero Landing ----------
Widget _buildLanding(BuildContext context) {
  return Center(
    key: const ValueKey("landing"),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 🔹 Título con estilo mixto
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: "Explora Nicaragua\n",
                style: GoogleFonts.playfairDisplay(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 16,
                      color: Colors.black.withOpacity(0.7),
                      offset: const Offset(3, 3),
                    ),
                  ],
                ),
              ),
              TextSpan(
                text: "a través de sus ",
                style: GoogleFonts.montserrat(
                  fontSize: 38,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: "alas",
                style: GoogleFonts.montserrat(
                  fontSize: 38,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromARGB(204, 255, 255, 0), // Amarillo neón
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),

        // 🔹 Subtítulo descriptivo
        Text(
          "Explora las maravillas naturales del país, observa aves migratorias y endémicas y vive experiencias únicas en reservas naturales",
          textAlign: TextAlign.center,
          style: GoogleFonts.openSans(
            fontSize: 18,
            color: Colors.white70,
            letterSpacing: 1.1,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 40),

        // 🔹 Botón moderno estilo "Explorar más"
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(202, 255, 255, 0),
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            elevation: 10,
            shadowColor: Colors.yellowAccent.withOpacity(0.6),
          ),
          onPressed: () => setState(() => currentIndex = 1),
          icon: const Text(""), // dejamos vacío porque el emoji va en el label
          label: Text(
            "Explorar más 🌍",
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    ),
  );
}

  // ---------- Menú item ----------
  Widget _menuItem(String title, int index) {
    final isActive = currentIndex == index;
    return InkWell(
      onTap: () => setState(() => currentIndex = index),
      borderRadius: BorderRadius.circular(8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: isActive ? Colors.greenAccent.withOpacity(0.2) : Colors.transparent,
        ),
        child: Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: isActive ? Colors.greenAccent : Colors.white,
          ),
        ),
      ),
    );
  }
}
