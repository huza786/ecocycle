import 'package:flutter/material.dart';

class SnackBarMessage extends StatelessWidget {
  final String data;
  const SnackBarMessage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(data),
    );
  }
}
