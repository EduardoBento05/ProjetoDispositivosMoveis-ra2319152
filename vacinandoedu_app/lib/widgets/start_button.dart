import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  final String title;
  final Color color;
  final Function function;

  const StartButton({
    Key? key,
    required this.title,
    required this.color,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.yellowAccent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: const BorderSide(
                width: 1.5,
                color: Color.fromARGB(255, 222, 243, 33),
              ),
            ),
          ),
        ),
        onPressed: () => function(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
