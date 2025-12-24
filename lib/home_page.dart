import 'dart:math';

import 'package:card_flip_game/flipper_card.dart';
import 'package:card_flip_game/wor_or_lost.dart';
import 'package:flutter/material.dart';
import 'package:page_flip_builder/page_flip_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _winningIndex = 0;
  int? _selectedIndex;
  bool haveChoosed = false;
  bool haveWon = false;

  final List<GlobalKey<PageFlipBuilderState>> _cardKeys =
      List.generate(2, (_) => GlobalKey<PageFlipBuilderState>());

  @override
  void initState() {
    super.initState();
    _winningIndex = Random().nextInt(2);
  }

  @override
  Widget build(context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: ListView.separated(
              itemCount: 2,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final pageFlipKey = _cardKeys[index];
                return PageFlipBuilder(
                  key: pageFlipKey,
                  frontBuilder: (_) => ConcealedCard(
                    onFlip: () {
                      if (haveChoosed) return;
                      setState(() {
                        haveChoosed = true;
                        _selectedIndex = index;
                        haveWon = index == _winningIndex;
                      });
                      pageFlipKey.currentState?.flip();
                    },
                  ),
                  backBuilder: (_) => AnswerCard(
                    isAnswer: index == _winningIndex,
                  ),
                );
              },
            ),
          ),
        ),
        Expanded(
          child: WonOrLost(
              haveChoosed: haveChoosed,
              haveWon: haveWon,
              selectedIndex: _selectedIndex,
              cardKeys: _cardKeys,
              onTryAgainPressed: () => setState(() {
                    haveChoosed = false;
                    _selectedIndex = null;
                    _winningIndex = Random().nextInt(2);
                  })),
        ),
      ],
    );
  }
}
