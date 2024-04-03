import 'package:flutter/cupertino.dart';

class NoEmojisFound extends StatelessWidget {
  const NoEmojisFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 108,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 24,
        ),
        child: const Center(
          child: Text(
            "No se han encontrado emojis",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
