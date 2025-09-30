import 'package:flutter/material.dart';
import '../widgets/gradient_button.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  final List<Map<String, String>> reservas = const [
    {
      "nombre": "Reserva La Máquina",
      "imagen": "assets/images/reserva1.jpg",
      "descripcionBreve": "Un paraíso escondido entre montañas, cascadas y biodiversidad.",
      "descripcionCompleta":
          "La Reserva La Máquina se caracteriza por sus espectaculares cascadas y senderos rodeados de bosque tropical. Aquí puedes contratar guías locales para tours de observación de aves, caminatas a miradores naturales y recorridos interpretativos sobre flora y fauna endémica. Ideal para los amantes de la fotografía y la aventura en contacto directo con la naturaleza.",
    },
    {
      "nombre": "Reserva Volcán Mombacho",
      "imagen": "assets/images/reserva2.jpg",
      "descripcionBreve": "Explora la nebliselva y disfruta de vistas panorámicas únicas.",
      "descripcionCompleta":
          "El Volcán Mombacho es famoso por sus bosques nubosos, su biodiversidad y su riqueza en aves exóticas. Los visitantes pueden contratar guías para recorrer los senderos El Puma o El Cráter, con explicaciones sobre especies endémicas y la historia volcánica de la región. Los tours incluyen miradores espectaculares hacia Granada, Las Isletas y el Lago Cocibolca.",
    },
    {
      "nombre": "Reserva Natural Montibelli",
      "imagen": "assets/images/Montibelli1.jpg",
      "descripcionBreve": "Un refugio privado ideal para el aviturismo en Nicaragua.",
      "descripcionCompleta":
          "La Reserva Natural Montibelli es reconocida internacionalmente por su oferta de avistamiento de aves, incluyendo especies como el Guardabarranco (ave nacional) y tucanes. Ofrecen recorridos guiados al amanecer y atardecer, hospedaje en eco-lodges y senderos interpretativos que combinan conservación y turismo sostenible. Es un lugar perfecto para quienes buscan tranquilidad y conexión con la naturaleza.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FEF6),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---- Encabezado ----
              Center(
                child: Column(
                  children: [
                    const Text(
                      "🌿 Reservas Naturales",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 6,
                      width: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xFF45B26B).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // ---- Lista de Reservas ----
              ...reservas.map((reserva) => _buildReservaCard(reserva, context)),

              const SizedBox(height: 40),
              Divider(color: Colors.grey.shade300, thickness: 1.2),
              const SizedBox(height: 30),

              // ---- Contacto ----
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFE8F9F1), Color(0xFFF6FEF6)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.06),
                      blurRadius: 12,
                      offset: Offset(0, 6),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      "📩 Contáctanos",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF2F6F0B),
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildTextField("Nombre", Icons.person),
                    const SizedBox(height: 14),
                    _buildTextField("Email", Icons.email),
                    const SizedBox(height: 14),
                    _buildTextField("Mensaje", Icons.message, maxLines: 4),
                    const SizedBox(height: 22),
                    GradientButton(
                      text: "Enviar Mensaje",
                      gradient: const LinearGradient(
                        colors: [Color(0xFF8EE3B1), Color(0xFF45B26B)],
                      ),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Mensaje enviado")),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // ---- Tarjeta Reserva ----
  Widget _buildReservaCard(Map<String, String> reserva, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 6)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen con animación sutil
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
            child: Image.asset(
              reserva["imagen"]!,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reserva["nombre"]!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1B5E20),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  reserva["descripcionBreve"]!,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(
                      child: GradientButton(
                        text: "🌍 Reservar",
                        gradient: const LinearGradient(
                          colors: [Color(0xFF8EE3B1), Color(0xFF45B26B)],
                        ),
                        onTap: () => _showMoreInfoDialog(context, reserva),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: GradientButton(
                        text: "ℹ️ Info",
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFBD9C7), Color(0xFFFFB98A)],
                        ),
                        onTap: () => _showMoreInfoDialog(context, reserva),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---- Dialogo Info ----
  void _showMoreInfoDialog(BuildContext context, Map<String, String> reserva) {
    showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          insetPadding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.asset(
                  reserva["imagen"]!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reserva["nombre"]!,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      reserva["descripcionCompleta"]!,
                      style: const TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                    const SizedBox(height: 24),
                    GradientButton(
                      text: "Reservar Ahora",
                      gradient: const LinearGradient(
                        colors: [Color(0xFF8EE3B1), Color(0xFF45B26B)],
                      ),
                      onTap: () {
                        Navigator.of(ctx).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Reservando en ${reserva["nombre"]}")),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ---- Campo de texto moderno ----
  Widget _buildTextField(String label, IconData icon, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFF45B26B)),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
