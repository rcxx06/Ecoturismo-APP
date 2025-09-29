import 'package:flutter/material.dart';
import '../widgets/gradient_button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FEF6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFDFF7EA),
        foregroundColor: const Color(0xFF1B5E20),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
        ),
        title: const Text("Volver"),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 360),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.all(22),
            width: MediaQuery.of(context).size.width > 560 ? 480 : double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: const [BoxShadow(color: Color(0x22000000), blurRadius: 16, offset: Offset(0, 8))],
            ),
            child: Column(
              children: [
                Hero(tag: 'login_lock', child: Icon(Icons.lock_outline, size: 64, color: Colors.green.shade400)),
                const SizedBox(height: 22),
                TextField(controller: emailController, decoration: const InputDecoration(labelText: "Correo Electrónico")),
                const SizedBox(height: 12),
                TextField(
                  controller: passwordController,
                  obscureText: _obscure,
                  decoration: InputDecoration(
                    labelText: "Contraseña",
                    suffixIcon: IconButton(
                      icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                      onPressed: () => setState(() => _obscure = !_obscure),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: GradientButton(
                    text: "Iniciar Sesión",
                    gradient: const LinearGradient(colors: [Color(0xFF8EE3B1), Color(0xFF45B26B)]),
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Login exitoso")),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
