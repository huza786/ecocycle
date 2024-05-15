import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recycle_app/View/setting_page/contact_us/components/appbar.dart';
import 'package:recycle_app/View/setting_page/contact_us/components/customtextfield.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ContactAppBar(),
            const CustomTextFormField(
              hintText: "Address",
              isLarge: false,
            ),
            const CustomTextFormField(
              hintText: "Email Address",
              isLarge: false,
            ),
            const CustomTextFormField(
              hintText: "Subject",
              isLarge: false,
            ),
            const CustomTextFormField(
              hintText: "Message",
              isLarge: true,
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: const SendMessegeButton(),
            )
          ],
        ),
      ),
    );
  }
}

class SendMessegeButton extends StatelessWidget {
  const SendMessegeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(104.h)),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(104.h)),
        height: 42.h,
        width: 206.w,
        child: const Center(child: Text("Send Message")),
      ),
    );
  }
}
