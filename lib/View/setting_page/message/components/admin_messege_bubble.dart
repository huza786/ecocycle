import 'package:flutter/material.dart';

class AdminMessageBubble extends StatelessWidget {
  final String messege;
  const AdminMessageBubble({super.key, required this.messege});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          // width: MediaQuery.of(context).size.width * .7,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(vertical: 6),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(24)),
          child: Text(
            messege,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          )),
    );
  }
}
