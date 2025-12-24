import 'package:flutter/material.dart';

class ConcealedCard extends StatelessWidget {
  const ConcealedCard({super.key, required this.onFlip});
  final VoidCallback onFlip;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFlip,
      child: Container(
        height: 190,
        decoration: BoxDecoration(
          color: Color(0xFFFEE853),
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
        child: Icon(Icons.question_mark),
      ),
    );
  }
}

class AnswerCard extends StatelessWidget {
  const AnswerCard({super.key, required this.isAnswer});
  final bool isAnswer;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      decoration: BoxDecoration(
        color: Color(0xFFE6E6E6),
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      child: Icon(isAnswer ? Icons.flutter_dash : null),
    );
  }
}
