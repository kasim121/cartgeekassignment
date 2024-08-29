import 'package:flutter/material.dart';

class DrawerMenuWidget extends StatelessWidget {
  final VoidCallback onClicked;
  const DrawerMenuWidget({super.key, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onClicked,
      icon: const Icon(Icons.menu),
      color: Colors.white,
    );
  }
}
