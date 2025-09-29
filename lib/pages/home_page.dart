import 'package:flutter/material.dart';
import 'landing_page.dart';
import 'catalogo_page.dart';
import 'profile_page.dart';
import 'contact_page.dart';
import 'educativo_page.dart'; // 👈 importa tu módulo educativo

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      LandingPage(onChangePage: (index) => setState(() => currentIndex = index)),
      CatalogoPage(),
      const ModuloEducativoPage(), 
      ProfilePage(),
      ContactPage(),
    ];

    final List<String> titles = [
      "Inicio",
      "Catálogo de Aves",
      "Módulo Educativo",
      "Perfil",
      "Contacto",
    ];

    return LayoutBuilder(builder: (context, constraints) {
      bool isDesktop = constraints.maxWidth > 800;

      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFDFF7EA),
          foregroundColor: const Color(0xFF1B5E20),
          title: Text(titles[currentIndex]),
          elevation: 0,
        ),
        body: Row(
          children: [
            if (isDesktop)
              NavigationRail(
                backgroundColor: const Color(0xFFF6FEF6),
                selectedIndex: currentIndex,
                onDestinationSelected: (index) => setState(() => currentIndex = index),
                labelType: NavigationRailLabelType.all,
                destinations: const [
                  NavigationRailDestination(icon: Icon(Icons.home), label: Text("Inicio")),
                  NavigationRailDestination(icon: Icon(Icons.filter_alt), label: Text("Catálogo")),
                  NavigationRailDestination(icon: Icon(Icons.school), label: Text("Educativo")), // 👈
                  NavigationRailDestination(icon: Icon(Icons.person), label: Text("Perfil")),
                  NavigationRailDestination(icon: Icon(Icons.contact_mail), label: Text("Contacto")),
                ],
              ),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 420),
                transitionBuilder: (child, animation) {
                  final inAnim = Tween<Offset>(
                    begin: const Offset(0.0, 0.05),
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
        bottomNavigationBar: isDesktop
            ? null
            : BottomNavigationBar(
                backgroundColor: const Color(0xFFF6FEF6),
                currentIndex: currentIndex,
                selectedItemColor: const Color(0xFF1B5E20),
                unselectedItemColor: Colors.grey,
                onTap: (index) => setState(() => currentIndex = index),
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
                  BottomNavigationBarItem(icon: Icon(Icons.filter_alt), label: "Catálogo"),
                  BottomNavigationBarItem(icon: Icon(Icons.school), label: "Educativo"), // 👈
                  BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
                  BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: "Contacto"),
                ],
              ),
      );
    });
  }
}
