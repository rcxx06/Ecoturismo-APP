import 'package:flutter/material.dart';

class BirdCard extends StatelessWidget {
  final String name;
  final String type;
  final String imageUrl;
  const BirdCard({required this.name, required this.type, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showBirdDialog(context),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(color: Color(0x11000000), blurRadius: 8, offset: Offset(0, 6)),
            BoxShadow(color: Color(0x04FFFFFF), blurRadius: 1, offset: Offset(-1, -1)),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
              child: Image.asset(
                imageUrl,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 6),
                  Text(type, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void _showBirdDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imageUrl, height: 150),
            const SizedBox(height: 12),
            Text("Tipo: $type"),
            const SizedBox(height: 6),
            const Text("Descripción: Ave hermosa de la región."),
          ],
        ),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cerrar"))],
      ),
    );
  }
}
