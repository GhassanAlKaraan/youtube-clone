import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(
          color: Color.fromARGB(255, 243, 33, 226),
          strokeWidth: 1.8,
        ),
      ),
    );
  }
}
