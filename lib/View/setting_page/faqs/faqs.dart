import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recycle_app/View/setting_page/faqs/components/expansion_tile.dart';
import 'package:recycle_app/View/shared_components/custom_app_bar.dart';
import 'package:recycle_app/View/utils/routes.dart';

class FAQs extends StatelessWidget {
  const FAQs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              title: "FAQs",
              context: context,
              navigationEnabled: true,
            ),
            Padding(
              padding: EdgeInsets.only(top: 88.h),
              child: const Text(
                "Frequently Asked Questions",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 14.h),
              child: const Text(
                "How can we help you?",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 70),
              child: FAQsExpansion(
                  question: "What can I recycle?",
                  answer:
                      "You can typically recycle paper, cardboard, glass bottles and jars, aluminum cans, steel cans, plastic bottles and containers labeled with recycling symbols, and certain electronics. Always check with your local recycling center or municipality for specific guidelines."),
            ),
            const FAQsExpansion(
                question: 'How do I recycle electronics?',
                answer:
                    "Many electronics can be recycled at designated drop-off locations or through electronics recycling programs. It's important to recycle electronics properly to prevent environmental harm from hazardous materials like lead and mercury. Check with your local recycling center or electronic retailers for options."),
            const FAQsExpansion(
              question: "Do I need to clean recyclables before recycling?",
              answer:
                  "Yes, it's a good idea to rinse out containers like jars and bottles before recycling to prevent contamination and ensure they can be properly processed. Remove any food residue or liquids to improve recycling efficiency.",
            ),
            const Padding(
              padding: EdgeInsets.only(top: 80),
              child: Text(
                "Have More Questions?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.popAndPushNamed(context, AppRoutes.contactUs);
                },
                child: Material(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(104)),
                  child: Container(
                    width: 206.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(104),
                        color: Colors.grey.shade50),
                    child: const Center(
                      child: Text("Contact Us"),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
