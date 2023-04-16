import 'package:flutter/material.dart';
import './configuration_page.dart';
import './initial_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaAtual = 0;

  final List<Widget> _paginas = [
    InitialPage(),
    ConfigurationPage(),
  ];
  setPaginaAtual(int pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _paginas[paginaAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        onTap: setPaginaAtual,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Pagina Inicial',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],
        backgroundColor: Color.fromARGB(255, 222, 243, 33),
      ),
    );
  }
}
