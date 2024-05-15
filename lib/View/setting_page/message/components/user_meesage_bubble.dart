import 'package:flutter/material.dart';

class UserMessageBubble extends StatelessWidget {
  final String message;
  const UserMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(24)),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Text(
            message,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
          )),
    );
  }
}
