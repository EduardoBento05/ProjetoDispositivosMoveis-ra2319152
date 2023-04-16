import 'package:flutter/material.dart';
import 'package:vacinandoedu_app/constants.dart%20';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  double _volume = 50.0;
  bool _temaEscuro = false;

  void _alterarVolume(double novoVolume) {
    setState(() {
      _volume = novoVolume;
    });
  }

  void _alterarTema(bool novotema) {
    setState(() {
      _temaEscuro = novotema;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Configurações'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Volume de Som',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Slider(
              value: _volume,
              min: 0,
              max: 100,
              divisions: 10,
              label: _volume.round().toString(),
              onChanged: (double novoVolume) {
                _alterarVolume(novoVolume);
              },
            ),
            SizedBox(height: 16.0),
            Text(
              'Tema:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: Text('Tema escuro'),
              value: _temaEscuro,
              onChanged: (bool novoTema) {
                _alterarTema(novoTema);
              },
            ),
          ],
        ),
      ),
    );
  }
}
