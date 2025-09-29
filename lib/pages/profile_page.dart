import 'package:flutter/material.dart';

// Importamos las páginas de login y registro
import 'login_page.dart';
import 'register_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Avatar del usuario
          const CircleAvatar(
            radius: 56,
            backgroundImage: AssetImage("assets/images/perfil.jpg"),
          ),
          const SizedBox(height: 18),

          // Título
          const Text(
            "Configuración de Usuario",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 18),

          // Opción de Iniciar Sesión
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text("Iniciar Sesión"),
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => LoginPage(),
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
          ),

          // Opción de Registro
          ListTile(
            leading: const Icon(Icons.person_add),
            title: const Text("Registro de Guía"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => RegisterPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
