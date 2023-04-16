import 'package:flutter/material.dart';
import 'package:vacinandoedu_app/widgets/next_button.dart';
import 'package:vacinandoedu_app/widgets/options_card.dart';

import '../models/questions_model.dart';
import './questions_widget.dart';
import '../constants.dart';
import './result_box.dart';

class Nivel1Fase2Widget extends StatefulWidget {
  const Nivel1Fase2Widget({super.key});

  @override
  State<Nivel1Fase2Widget> createState() => _Nivel1Fase2WidgetState();
}

class _Nivel1Fase2WidgetState extends State<Nivel1Fase2Widget> {
  List<Question> _questions1 = [
    Question(
      id: '6',
      title:
          "Qual Doença que provoca pequenas feridas por todo corpo, febre alta e fraqueza?",
      options: const {
        'Sarampo': false,
        'COVID': false,
        'Varíola': true,
        'Gripe': false
      },
    ),
    Question(
      id: '7',
      title: "Como a varíola era transmitida?",
      options: const {
        'AR/goticulas de saliva': true,
        'Coçando a cabeça': false,
        'levantando o braço': false,
        'correndo': false
      },
    ),
    Question(
      id: '8',
      title: "Que médico combinou a Prática da Variolação?",
      options: const {
        'Edward Jenner': true,
        'Drauzio Varela': false,
        'Oswaldo Cruz': false,
        'Crawford Long': false
      },
    ),
    Question(
      id: '9',
      title: "A prática da variolação foi desenvolvida em Qual País?",
      options: const {
        'Egito': false,
        'China': true,
        'Grécia': false,
        'Inglaterra': false
      },
    ),
    Question(
      id: '10',
      title: "Este nível é sobre o que?",
      options: const {
        'A Historia da Vacina': true,
        'COVID': false,
        'Vacininha': false,
        'Futebol': false
      },
    ),
    Question(
      id: '11',
      title: "Mais de quantos anos a primeira vacina apareceu no mundo?",
      options: const {
        '200': true,
        '100': false,
        '50': false,
        '27': false,
      },
    ),
    Question(
      id: '12',
      title: "A primeira Vacina foi criada para combater qual doença?",
      options: const {
        'Varíola': true,
        'Sarampo': false,
        'Febre-Amarela': false,
        'Gripe': false,
      },
    ),
    Question(
      id: '13',
      title: "A Primeira Vacina Surgiu em Que País?",
      options: const {
        'Estados Unidos': false,
        'Brasil': false,
        'Inglaterra': true,
        'China': false,
      },
    )
  ];

  int index = 0;
  bool isPressed = false;
  int score = 0;
  bool isAlreadySelected = false;

  void nextQuestion() {
    if (index == _questions1.length - 1) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => ResultBox(
          result: score,
          questionLenght: _questions1.length,
          onPressed: startOver,
        ),
      );
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Por favor Seleciona uma Opção"),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
        ));
      }
    }
  }

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }

  void checkAnswerAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score++;
      }

      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text("Quiz - Fase 2"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "Score: $score",
              style: TextStyle(fontSize: 18.0),
            ),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            QuestionsWidget(
                question: _questions1[index].title,
                indexAction: index,
                totalQuestions: _questions1.length),
            const Divider(color: neutral),
            const SizedBox(height: 25.0),
            for (int i = 0; i < _questions1[index].options.length; i++)
              GestureDetector(
                onTap: () => checkAnswerAndUpdate(
                    _questions1[index].options.values.toList()[i] == true),
                child: OptionsCard(
                  options: _questions1[index].options.keys.toList()[i],
                  color: isPressed
                      ? _questions1[index].options.values.toList()[i] == true
                          ? correct
                          : incorrect
                      : neutral,
                ),
              )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: NextButton(
          nextQuestion: nextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
