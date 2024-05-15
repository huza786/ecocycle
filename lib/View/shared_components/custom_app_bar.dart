import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recycle_app/View/utils/colorslist.dart';

class CustomAppBar extends StatelessWidget {
  final BuildContext context;
  final String title;
  final bool navigationEnabled;
  const CustomAppBar(
      {super.key,
      required this.title,
      required this.context,
      required this.navigationEnabled});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 120),
            painter: RPSCustomPainter(),
          ),
          Text(
            title,
            style: const TextStyle(
                fontSize: 28, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          navigationEnabled
              ? Positioned(
                  top: 35.h,
                  left: 20.w,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = MyAppColors.primaryColorDark
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0023256, size.height * 1.0200000);
    path_0.lineTo(0, 0);
    path_0.lineTo(size.width, size.height * -0.0100000);
    path_0.lineTo(size.width, size.height);
    path_0.quadraticBezierTo(size.width * 0.9981395, size.height * 0.7690000,
        size.width * 0.9330233, size.height * 0.7880000);
    path_0.cubicTo(
        size.width * 0.7113953,
        size.height * 0.7860000,
        size.width * 0.3402326,
        size.height * 0.8080000,
        size.width * 0.0465116,
        size.height * 0.7800000);
    path_0.quadraticBezierTo(size.width * 0.0001163, size.height * 0.8000000,
        size.width * 0.0023256, size.height * 1.0200000);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);

    // Layer 1

    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
