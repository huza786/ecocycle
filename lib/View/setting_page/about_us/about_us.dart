import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recycle_app/View/shared_components/custom_app_bar.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: "About Our App",
            context: context,
            navigationEnabled: true,
          ),
          Image.asset(
            "assets/images/recycle_app.png",
            height: 178.h,
            width: 178.w,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: RichText(
              text: TextSpan(
                text: 'Ecocycle ',
                style: DefaultTextStyle.of(context).style.copyWith(
                    decoration: TextDecoration.none,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontFamily: "Poppins"),
                children: const <TextSpan>[
                  TextSpan(
                      text:
                          'is a collaborative initiative with the intermunicipal waste company, aimed at providing a comprehensive waste management solution in the UK. Our app offers a range of features including an overview of waste collections in your area, locations of collection points nearby, and a sorting guide to assist you in correctly managing your waste.',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 30,
                horizontal: MediaQuery.of(context).size.width / 6),
            child: const Divider(
              thickness: 1,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
