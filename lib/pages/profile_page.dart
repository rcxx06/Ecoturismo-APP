import 'package:flutter/material.dart';

// Importamos las páginas
import 'login_page.dart';
import 'register_page.dart';
import 'register_guid_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fondo degradado suave
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE8F9F1), Color(0xFFDFF7EA)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // ---- Avatar con borde decorativo ----
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF45B26B), Color(0xFF8EE3B1)],
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/images/perfil.jpg"),
                  ),
                ),
                const SizedBox(height: 16),

                // ---- Título y subtítulo ----
                const Text(
                  "Configuración de Usuario",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B5E20),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Administra tu cuenta y preferencias",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 30),

                // ---- Opciones con tarjetas ----
                _buildOptionCard(
                  context,
                  icon: Icons.login,
                  color: Colors.blueAccent,
                  title: "Iniciar Sesión",
                  page: const LoginPage(),
                ),
                const SizedBox(height: 14),
                _buildOptionCard(
                  context,
                  icon: Icons.person_add_alt_1,
                  color: Colors.orangeAccent,
                  title: "Registro Normal",
                  page: const RegisterPage(),
                ),
                const SizedBox(height: 14),
                _buildOptionCard(
                  context,
                  icon: Icons.person_add,
                  color: Colors.green,
                  title: "Registro de Guía",
                  page: const RegisterGuidePage(),
                ),

                const SizedBox(height: 40),

                // ---- Botón de cerrar sesión ----
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  icon: const Icon(Icons.logout, color: Colors.white),
                  label: const Text(
                    "Cerrar Sesión",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Sesión cerrada")),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ---- Método para tarjetas de opciones ----
  Widget _buildOptionCard(BuildContext context,
      {required IconData icon,
      required Color color,
      required String title,
      required Widget page}) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => page,
            transitionsBuilder: (ctx, anim, sec, child) {
              return FadeTransition(
                opacity: anim,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.2, 0),
                    end: Offset.zero,
                  ).animate(anim),
                  child: child,
                ),
              );
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.15),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
