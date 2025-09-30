import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  final List<Map<String, dynamic>> guias = const [
    {
      "id": "G1",
      "nombre": "David Soto",
      "descripcion":
          "Especialista en rutas de migración de rapaces y aves canoras.",
      "experiencia": "12 años",
      "especialidad": "Aves Rapaces / Migración Boreal",
      "idioma": "Español, Inglés (fluido)",
      "precio": "\$150 / Día Completo",
      "certificacion": "Certificación ICT - 2024",
    },
    {
      "id": "G2",
      "nombre": "Camila Rivas",
      "descripcion":
          "Apasionada por las especies endémicas y la fotografía de vida silvestre.",
      "experiencia": "7 años",
      "especialidad": "Especies Endémicas / Bosque Nublado",
      "idioma": "Español, Francés",
      "precio": "\$120 / Medio Día",
      "certificacion": "Certificación MINAE - 2023",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FEF6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
        title: const Text(
          "Global Wings",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xFF2F6F0B),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isDesktop = constraints.maxWidth > 900;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: isDesktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 1, child: _buildSidebar(context)),
                      const SizedBox(width: 20),
                      Expanded(flex: 2, child: _buildMainContent(context)),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildMainContent(context),
                      const SizedBox(height: 20),
                      _buildSidebar(context),
                    ],
                  ),
          );
        },
      ),
    );
  }

  // ---- Sidebar con filtros ----
  Widget _buildSidebar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Ajusta tu Expedición",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2F6F0B),
            ),
          ),
          const SizedBox(height: 16),
          _buildDropdown("Destino Principal", [
            "Reserva La Máquina",
            "Volcán Mombacho",
            "Montibelli",
          ]),
          const SizedBox(height: 16),
          _buildDatePicker(context),
          const SizedBox(height: 20),
          const Text(
            "Servicios Adicionales",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildCheckbox("Transporte Local Certificado (+\$50)"),
          _buildCheckbox("Alquiler de Binoculares HD (+\$15)"),
          _buildCheckbox("Gestión de Hospedaje (Gratis)"),
          _buildCheckbox("Picnic Ecoturístico (+\$10)"),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF45B26B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              ),
              child: const Text(
                "Buscar Guías Disponibles",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---- Contenido principal (guías + garantía) ----
  Widget _buildMainContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Reserva de Guías Certificados y Servicios",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          "Selecciona tu destino, fecha y servicios complementarios. "
          "Solo trabajamos con **Guías Locales Certificados** para garantizar "
          "la seguridad y el mejor avistamiento.",
          style: TextStyle(fontSize: 14, color: Colors.black87),
        ),
        const SizedBox(height: 24),

        // ---- Cards de guías ----
        ...guias.map((g) => _buildGuiaCard(context, g)).toList(),

        const SizedBox(height: 28),
        _buildGarantiaCertificacion(),
      ],
    );
  }

  // ---- Card de guía ----
  Widget _buildGuiaCard(BuildContext context, Map<String, dynamic> guia) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 12, offset: Offset(0, 6)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Encabezado con nombre y certificación
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFF45B26B),
                radius: 28,
                child: Text(
                  guia["id"],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          guia["nombre"],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.black87,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE8F9F1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            guia["certificacion"],
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF2F6F0B),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      guia["descripcion"],
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Detalles
          Text("Experiencia: ${guia["experiencia"]}"),
          Text("Especialidad: ${guia["especialidad"]}"),
          Text("Idioma: ${guia["idioma"]}"),
          const SizedBox(height: 12),

          // Precio + botón
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                guia["precio"],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xFF1B5E20),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF45B26B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text("Reservar Guía"),
              )
            ],
          )
        ],
      ),
    );
  }

  // ---- Garantía de Certificación ----
  Widget _buildGarantiaCertificacion() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F9F1),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Text(
        "Garantía de Certificación\n\n"
        "Todos nuestros guías poseen certificaciones oficiales emitidas por las entidades "
        "gubernamentales de turismo o medio ambiente de sus respectivos países (ej. ICT en Costa Rica, "
        "MINAE en Ecuador). Esto asegura conocimiento profundo de las aves, ética de observación y primeros auxilios.",
        style: TextStyle(fontSize: 13, color: Colors.black87),
      ),
    );
  }

  // ---- Dropdown ----
  Widget _buildDropdown(String label, List<String> opciones) {
    return DropdownButtonFormField<String>(
      items: opciones
          .map((o) => DropdownMenuItem(value: o, child: Text(o)))
          .toList(),
      onChanged: (v) {},
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
    );
  }

  // ---- Checkbox ----
  Widget _buildCheckbox(String text) {
    return CheckboxListTile(
      value: false,
      onChanged: (_) {},
      dense: true,
      contentPadding: EdgeInsets.zero,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(text, style: const TextStyle(fontSize: 14)),
    );
  }

  // ---- Date Picker ----
  Widget _buildDatePicker(BuildContext context) {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: "Fecha de Avistamiento",
        suffixIcon: const Icon(Icons.calendar_today, color: Color(0xFF45B26B)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onTap: () async {
        // ignore: unused_local_variable
        DateTime? picked = await showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
          initialDate: DateTime.now(),
        );
      },
    );
  }
}
