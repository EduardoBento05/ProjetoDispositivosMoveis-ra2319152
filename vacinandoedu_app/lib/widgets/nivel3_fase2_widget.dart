import 'package:flutter/material.dart';
import 'package:vacinandoedu_app/widgets/next_button.dart';
import 'package:vacinandoedu_app/widgets/options_card.dart';
import '../models/questions_model.dart';
import '../pages/configuration_page.dart';
import '../pages/initial_page.dart';
import './questions_widget.dart';
import '../constants.dart';
import './result_box.dart';
import 'bottom_navigationbar_widget.dart';

class Nivel3Fase2Widget extends StatefulWidget {
  const Nivel3Fase2Widget({super.key});

  @override
  State<Nivel3Fase2Widget> createState() => _Nivel3Fase2WidgetState();
}

class _Nivel3Fase2WidgetState extends State<Nivel3Fase2Widget> {
  List<Question> _questions1 = [
    Question(
      id: '1',
      title: "Este nível é sobre o que?",
      options: const {
        'A Historia da Vacina': false,
        'Quem são os profissionais que desenvolvem as vacinas': true,
        'Algumas das Vacinas Mais Importantes': false,
        'Medicina': false
      },
    ),
    Question(
      id: '2',
      title: "Quais Tipos de Profissionais podem desenvolver as Vacinas?",
      options: const {
        'Biomédicos/Imunologistas': true,
        'Médicos': false,
        'Enfermeiros': false,
        'Socorristas': false,
      },
    ),
    Question(
      id: '3',
      title:
          "Qual Área o biomédico deve se especializar para Produzir Vacinas?",
      options: const {
        'Ortopedia': false,
        'Vacinologia': false,
        'Imunologia': true,
        'Radioterapia': false,
      },
    ),
    Question(
      id: '4',
      title: "O biomédico imunologista estuda diaramente o que?",
      options: const {
        'Doenças Infeciosas': true,
        'Português': false,
        'Geografia': false,
        'História': false,
      },
    ),
    Question(
      id: '5',
      title:
          "O biomédico imunologista estuda diaramente quais tipos de tratamento?",
      options: const {
        'Gripe': false,
        'Prevenção de Patologia': true,
        'Matemática': false,
        'Covid': false
      },
    ),
    Question(
      id: '6',
      title: "O que o Imunologista Estudam?",
      options: const {
        'Resfriados': false,
        'Gripe': false,
        'Educação Física': false,
        'Sistema Imunologico': true,
      },
    ),
    Question(
      id: '7',
      title:
          "Quais Graduações são necessárias para especializar em imunologia?",
      options: const {
        'Medicina': false,
        'Ciências Biológicas': false,
        'Biomedicina': false,
        'Todas as alternativas': true,
      },
    ),
    Question(
      id: '8',
      title: "Os imunologistas podem atuar no desenvolvimento das vacinas?",
      options: const {
        'sim': true,
        'não': false,
        'mentira': false,
        'as vezes': false,
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
