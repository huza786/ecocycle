import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FAQsExpansion extends StatelessWidget {
  final String question;
  final String answer;
  const FAQsExpansion(
      {super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 58.w, vertical: 6),
      child: Material(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
          ),
          child: ExpansionTile(
            title: Text(
              question,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(answer),
              )
            ],
          ),
        ),
      ),
    );
  }
}
