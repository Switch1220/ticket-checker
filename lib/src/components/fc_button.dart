import 'package:flutter/material.dart';

import '../routing/router.dart';

class FCButton extends StatelessWidget {
  final String label;
  final Icon icon;
  final VoidCallback? onPressed;
  const FCButton(
      {super.key, required this.label, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      label: Text(label),
      icon: icon,
    );
  }
}
