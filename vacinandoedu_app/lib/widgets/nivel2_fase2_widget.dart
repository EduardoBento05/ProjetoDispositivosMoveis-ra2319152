import 'package:flutter/material.dart';
import 'package:vacinandoedu_app/widgets/next_button.dart';
import 'package:vacinandoedu_app/widgets/options_card.dart';
import '../models/questions_model.dart';
import './questions_widget.dart';
import '../constants.dart';
import './result_box.dart';

class Nivel2Fase2Widget extends StatefulWidget {
  const Nivel2Fase2Widget({super.key});

  @override
  State<Nivel2Fase2Widget> createState() => _Nivel2Fase2WidgetState();
}

class _Nivel2Fase2WidgetState extends State<Nivel2Fase2Widget> {
  List<Question> _questions1 = [
    Question(
      id: '1',
      title: "Este nível é sobre o que?",
      options: const {
        'A Historia da Vacina': false,
        'COVID': false,
        'Algumas das Vacinas Mais Importantes': true,
        'Medicina': false
      },
    ),
    Question(
      id: '2',
      title: "Todas as Vacinas São Importantes?",
      options: const {
        'Sim': true,
        'Talvez': false,
        'Não sei': false,
        'Depende': false,
      },
    ),
    Question(
      id: '3',
      title: "Quantas Vacinas vocês aprenderam durante as Aulas?",
      options: const {
        '2': false,
        '5': false,
        '6': true,
        '4': false,
      },
    ),
    Question(
      id: '4',
      title: "O que a vacina BCG combate?",
      options: const {
        'HBV': false,
        'PolioVirus': false,
        'Tuberculose': true,
        'Caxumba': false,
      },
    ),
    Question(
      id: '5',
      title: "O que a vacina Hepatite B previne?",
      options: const {
        'Caxumba': false,
        'Tuberculose': false,
        'HBV': true,
        'Gripe': false
      },
    ),
    Question(
      id: '6',
      title: "Quem deve Tomar a vacina de Hepatite B",
      options: const {
        'Adultos': false,
        'Crianças': false,
        'Todos': true,
        'Idosos': false
      },
    ),
    Question(
      id: '7',
      title: "O que a vacina de Poliomielite  previne?",
      options: const {
        'Caxumba': false,
        'Poliovirus': true,
        'HBC': false,
        'Sarampo': false
      },
    ),
    Question(
      id: '8',
      title: "Até quando é recomentando tomar doses de Poliomielite?",
      options: const {
        '12 meses': false,
        '13 meses': false,
        '14 meses': false,
        '15 meses': true,
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
