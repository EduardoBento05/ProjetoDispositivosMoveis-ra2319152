import 'package:flutter/material.dart';
import 'package:vacinandoedu_app/pages/configuration_page.dart';
import 'package:vacinandoedu_app/pages/initial_page.dart';
import 'package:vacinandoedu_app/pages/nivel1_page.dart';
import 'package:vacinandoedu_app/pages/nivel2_page.dart';
import 'package:vacinandoedu_app/pages/nivel3_page.dart';
import 'package:vacinandoedu_app/widgets/start_button.dart';

import '../constants.dart ';
import '../widgets/bottom_navigationbar_widget.dart';

class NiveisPage extends StatefulWidget {
  const NiveisPage({super.key});

  @override
  State<NiveisPage> createState() => _NiveisPageState();
}

class _NiveisPageState extends State<NiveisPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: const Text("Níveis"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StartButton(
              title: "Nivel - 1: A História da Vacina",
              color: Colors.white,
              function: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Nivel1Page(),
                ),
              ),
            ),
            StartButton(
              title: "Nivel - 2: Importância da Vacina",
              color: Colors.white,
              function: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Nivel2Page(),
                ),
              ),
            ),
            StartButton(
              title: "Nivel - 3: Profissionais da Vacina",
              color: Colors.white,
              function: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Nivel3Page(),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(
        buttons: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.home),
          ),
          IconButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConfigurationPage(),
                )),
            icon: Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () => null,
            icon: Icon(Icons.audiotrack),
          ),
        ],
      ),
    );
  }
}
