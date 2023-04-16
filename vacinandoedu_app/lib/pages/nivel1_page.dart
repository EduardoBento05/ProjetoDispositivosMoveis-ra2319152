import 'package:flutter/material.dart';
import 'package:vacinandoedu_app/constants.dart';
import 'package:vacinandoedu_app/widgets/nivel1_fase1_widget.dart';
import 'package:vacinandoedu_app/widgets/nivel1_fase2_widget.dart';
import 'package:vacinandoedu_app/widgets/nivel1_fase3_widget.dart';
import 'package:vacinandoedu_app/widgets/start_button.dart';

class Nivel1Page extends StatefulWidget {
  const Nivel1Page({super.key});

  @override
  State<Nivel1Page> createState() => _Nivel1PageState();
}

class _Nivel1PageState extends State<Nivel1Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text("Nivel - 1 A Historia da Vacina"),
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
                  builder: (context) => Nivel1Fase1Widget(),
                ),
              ),
            ),
            StartButton(
              title: "Fase 2 - ",
              color: Colors.white,
              function: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Nivel1Fase2Widget(),
                ),
              ),
            ),
            StartButton(
              title: "Fase 3 - ",
              color: Colors.white,
              function: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Nivel1Fase3Widget(),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
