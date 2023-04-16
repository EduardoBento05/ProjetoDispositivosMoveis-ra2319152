import 'package:flutter/material.dart';
import 'package:vacinandoedu_app/pages/configuration_page.dart';
import 'package:vacinandoedu_app/pages/niveis_page.dart';
import '../widgets/logo.dart';
import '../widgets/start_button.dart';
import '../constants.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "VacinandoEdu",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Logo(),
            StartButton(
              title: 'Jogar',
              color: Colors.white,
              function: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NiveisPage(),
                    )),
              },
            ),
            StartButton(
              title: 'Configurações',
              color: Colors.white,
              function: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ConfigurationPage(),
                    )),
              },
            ),
            StartButton(
              title: 'Sair',
              color: Colors.white,
              function: () => {},
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
