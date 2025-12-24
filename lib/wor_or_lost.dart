import 'package:flutter/material.dart';
import 'package:page_flip_builder/page_flip_builder.dart';

class WonOrLost extends StatelessWidget {
  const WonOrLost({
    super.key,
    required this.haveChoosed,
    required this.haveWon,
    required int? selectedIndex,
    required this.onTryAgainPressed,
    required List<GlobalKey<PageFlipBuilderState>> cardKeys,
  })  : _selectedIndex = selectedIndex,
        _cardKeys = cardKeys;

  final bool haveChoosed;
  final bool haveWon;
  final int? _selectedIndex;
  final VoidCallback onTryAgainPressed;
  final List<GlobalKey<PageFlipBuilderState>> _cardKeys;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: haveChoosed ? 1.0 : 0.0,
      duration: Duration(milliseconds: 300),
      child: Column(
        children: [
          Text(
            (haveWon ? "You Won!" : "You Lost"),
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: haveWon ? Colors.green : Colors.red),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (_selectedIndex != null) {
                _cardKeys[_selectedIndex].currentState?.flip();
                Future.delayed(const Duration(milliseconds: 500),
                    () => onTryAgainPressed());
              }
            },
            child: const Text("Try Again"),
          ),
        ],
      ),
    );
  }
}
