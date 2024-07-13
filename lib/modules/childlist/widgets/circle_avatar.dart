import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      foregroundImage: AssetImage("assets/images/child.png"),
    );
  }
}
