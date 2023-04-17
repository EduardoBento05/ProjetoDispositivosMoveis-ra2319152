import 'package:flutter/material.dart';
import 'package:vacinandoedu_app/widgets/nivel2_fase1_widget.dart';
import 'package:vacinandoedu_app/widgets/nivel2_fase2_widget.dart';
import 'package:vacinandoedu_app/widgets/nivel2_fase3_widget.dart';
import '../constants.dart ';
import '../widgets/bottom_navigationbar_widget.dart';
import '../widgets/start_button.dart';
import 'configuration_page.dart';
import 'initial_page.dart';

class Nivel2Page extends StatelessWidget {
  const Nivel2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text("Nivel - 2 Importância da Vacina"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StartButton(
              title: "Fase 1 - ",
              color: Colors.white,
              function: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Nivel2Fase1Widget(),
                ),
              ),
            ),
            StartButton(
              title: "Fase 2 - ",
              color: Colors.white,
              function: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Nivel2Fase2Widget(),
                ),
              ),
            ),
            StartButton(
              title: "Fase 3 - ",
              color: Colors.white,
              function: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Nivel2Fase3Widget(),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(
        buttons: [
          IconButton(
            onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => InitialPage(),
                ),
                (route) => false),
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
