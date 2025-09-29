import 'package:flutter/material.dart';

class RegisterGuidePage extends StatelessWidget {
  const RegisterGuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFA8E6CF), Color(0xFFDCEDC1)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _buildTitleBadge("Global Wings"),
                  const SizedBox(height: 40),
                  _buildForm(
                    context,
                    title: "Registro de Guía",
                    fields: [
                      {"label": "Nombre Completo", "icon": Icons.person},
                      {"label": "Correo Electrónico", "icon": Icons.email},
                      {"label": "Certificación", "icon": Icons.school},
                      {"label": "Especialización", "icon": Icons.work},
                      {"label": "Contraseña", "icon": Icons.lock, "obscure": true},
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF00C853), Color(0xFFB2FF59)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 12, offset: Offset(0, 6))],
      ),
      child: Text(text,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: "Cursive")),
    );
  }

  Widget _buildForm(BuildContext context, {required String title, required List<Map<String, dynamic>> fields}) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 15, offset: Offset(0, 6))],
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green)),
          const SizedBox(height: 20),
          ...fields.map((f) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextField(
                  obscureText: f["obscure"] ?? false,
                  decoration: InputDecoration(
                    labelText: f["label"],
                    prefixIcon: Icon(f["icon"]),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              )),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              child: const Text("Registrarse", style: TextStyle(fontSize: 18)),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              child: const Text("Volver", style: TextStyle(fontSize: 16, color: Colors.green)),
            ),
          ),
        ],
      ),
    );
  }
}
