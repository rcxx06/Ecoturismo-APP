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
          child: LayoutBuilder(
            builder: (context, constraints) {
              double maxWidth =
                  constraints.maxWidth < 600 ? constraints.maxWidth * 0.9 : 500;

              return SingleChildScrollView(
                child: Column(
                  children: [
                    // Franja superior con título
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      color: const Color(0xFF9ED8B0),
                      child: const Text(
                        "Global Wings",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B5E20),
                          fontFamily: "Cursive",
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Formulario en tarjeta
                    Container(
                      width: maxWidth,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Registro de Guía",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Cursive",
                              color: Color(0xFF4CAF50),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Campos
                          _buildTextField("Nombre Completo", Icons.person),
                          const SizedBox(height: 16),
                          _buildTextField("Correo Electrónico", Icons.email),
                          const SizedBox(height: 16),
                          _buildTextField("Certificación", Icons.school),
                          const SizedBox(height: 16),
                          _buildTextField("Especialización", Icons.work),
                          const SizedBox(height: 16),
                          _buildTextField("Contraseña", Icons.lock,
                              obscureText: true),
                          const SizedBox(height: 24),

                          // Botón registrar
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF45B26B),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                "Registrarse",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Botón volver
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () => Navigator.pop(context),
                              style: OutlinedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                "Volver",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // TextField con icono
  Widget _buildTextField(String label, IconData icon,
      {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.green),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
