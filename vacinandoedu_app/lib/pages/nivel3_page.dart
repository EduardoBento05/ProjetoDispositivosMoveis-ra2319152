import 'package:flutter/material.dart';
import 'package:vacinandoedu_app/widgets/nivel3_fase1_widget.dart';
import 'package:vacinandoedu_app/widgets/nivel3_fase2_widget.dart';
import 'package:vacinandoedu_app/widgets/nivel3_fase3_widget.dart';
import '../constants.dart ';
import '../widgets/bottom_navigationbar_widget.dart';
import '../widgets/start_button.dart';
import 'configuration_page.dart';
import 'initial_page.dart';

class Nivel3Page extends StatelessWidget {
  const Nivel3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text("Nivel - 3 Profissionais da Vacina"),
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
                  builder: (context) => Nivel3Fase1Widget(),
                ),
              ),
            ),
            StartButton(
              title: "Fase 2 - ",
              color: Colors.white,
              function: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Nivel3Fase2Widget(),
                ),
              ),
            ),
            StartButton(
              title: "Fase 3 - ",
              color: Colors.white,
              function: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Nivel3Fase3Widget(),
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
