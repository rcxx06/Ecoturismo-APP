import 'package:flutter/material.dart';
import '../widgets/gradient_button.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  final List<Map<String, String>> reservas = const [
    {
      "nombre": "Reserva La Máquina",
      "imagen": "assets/images/reserva1.jpg",
      "descripcionBreve":
          "Un paraíso escondido entre montañas, cascadas y biodiversidad.",
      "descripcionCompleta":
          "La Reserva La Máquina se caracteriza por sus espectaculares cascadas y senderos rodeados de bosque tropical. Aquí puedes contratar guías locales para tours de observación de aves, caminatas a miradores naturales y recorridos interpretativos sobre flora y fauna endémica. Ideal para los amantes de la fotografía y la aventura en contacto directo con la naturaleza.",
    },
    {
      "nombre": "Reserva Volcán Mombacho",
      "imagen": "assets/images/reserva2.jpg",
      "descripcionBreve":
          "Explora la nebliselva y disfruta de vistas panorámicas únicas.",
      "descripcionCompleta":
          "El Volcán Mombacho es famoso por sus bosques nubosos, su biodiversidad y su riqueza en aves exóticas. Los visitantes pueden contratar guías para recorrer los senderos El Puma o El Cráter, con explicaciones sobre especies endémicas y la historia volcánica de la región. Los tours incluyen miradores espectaculares hacia Granada, Las Isletas y el Lago Cocibolca.",
    },
    {
      "nombre": "Reserva Natural Montibelli",
      "imagen": "assets/images/Montibelli1.jpg",
      "descripcionBreve":
          "Un refugio privado ideal para el aviturismo en Nicaragua.",
      "descripcionCompleta":
          "La Reserva Natural Montibelli es reconocida internacionalmente por su oferta de avistamiento de aves, incluyendo especies como el Guardabarranco (ave nacional) y tucanes. Ofrecen recorridos guiados al amanecer y atardecer, hospedaje en eco-lodges y senderos interpretativos que combinan conservación y turismo sostenible. Es un lugar perfecto para quienes buscan tranquilidad y conexión con la naturaleza.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "🌿 Reservas Naturales Disponibles",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...reservas.map((reserva) => _buildReservaCard(reserva, context)),
            const SizedBox(height: 30),
            const Divider(thickness: 1.2),
            const SizedBox(height: 20),
            // Contacto moderno
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFDFF7EA), Color(0xFFF6FEF6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    "📩 Contáctanos",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1B5E20),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildTextField("Nombre"),
                  const SizedBox(height: 12),
                  _buildTextField("Email"),
                  const SizedBox(height: 12),
                  _buildTextField("Mensaje", maxLines: 4),
                  const SizedBox(height: 18),
                  GradientButton(
                    text: "Enviar",
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
          ],
        ),
      ),
    );
  }

  Widget _buildReservaCard(Map<String, String> reserva, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => _showImageDialog(context, reserva),
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                reserva["imagen"]!,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reserva["nombre"]!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1B5E20),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  reserva["descripcionBreve"]!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: GradientButton(
                        text: "Reservar Guía",
                        gradient: const LinearGradient(
                          colors: [Color(0xFF8EE3B1), Color(0xFF45B26B)],
                        ),
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text("Reservando guía para ${reserva["nombre"]}")),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GradientButton(
                        text: "Más Info",
                        gradient: const LinearGradient(
                          colors: [Color(0xFFF6E3D6), Color(0xFFFFCDA3)],
                        ),
                        onTap: () {
                          _showMoreInfoDialog(context, reserva);
                        },
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

  // Imagen centrada con X
  void _showImageDialog(BuildContext context, Map<String, String> reserva) {
    showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          insetPadding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  reserva["imagen"]!,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () => Navigator.of(ctx).pop(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      shape: BoxShape.circle,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Icon(Icons.close, color: Colors.white, size: 24),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Más Info centrado con X
  void _showMoreInfoDialog(BuildContext context, Map<String, String> reserva) {
    showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          insetPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          reserva["imagen"]!,
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 16),
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
                        style:
                            const TextStyle(fontSize: 15, color: Colors.black87),
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
                            SnackBar(
                                content: Text(
                                    "Reservando guía para ${reserva["nombre"]}")),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () => Navigator.of(ctx).pop(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      shape: BoxShape.circle,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Icon(Icons.close, color: Colors.white, size: 24),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTextField(String label, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(Icons.edit, color: Color(0xFF45B26B)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
