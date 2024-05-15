import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recycle_app/View/utils/colorslist.dart';

//Add this CustomPaint widget to the Widget Tree
class MessageAppBar extends StatelessWidget {
  const MessageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 250),
          painter: MessagePainter(),
        ),
        Positioned(
          top: 40.h,
          left: 20.h,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
        const Text(
          "Messages",
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.w700, color: Colors.white),
        )
      ],
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class MessagePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.1507538);
    path_0.cubicTo(0, size.height * 0.06749497, size.width * 0.03123605, 0,
        size.width * 0.06976744, 0);
    path_0.lineTo(size.width * 0.9302326, 0);
    path_0.cubicTo(size.width * 0.9687651, 0, size.width,
        size.height * 0.06749497, size.width, size.height * 0.1507538);
    path_0.lineTo(size.width, size.height * 0.4924623);
    path_0.cubicTo(
        size.width,
        size.height * 0.5757236,
        size.width * 0.9687651,
        size.height * 0.6432161,
        size.width * 0.9302326,
        size.height * 0.6432161);
    path_0.lineTo(0, size.height * 0.6432161);
    path_0.lineTo(0, size.height * 0.1507538);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = MyAppColors.primaryColorDark.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.04883721, size.height * 0.9597990);
    path_1.lineTo(size.width * 0.1414819, size.height * 0.6432161);
    path_1.lineTo(size.width * -0.04380744, size.height * 0.6432161);
    path_1.lineTo(size.width * 0.04883721, size.height * 0.9597990);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = MyAppColors.primaryColorDark.withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
} 
/**class RPSCustomPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  // Layer 1
  
  Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    Path path_0 = Path();
    path_0.moveTo(size.width*0.0004043,size.height*1.0079565);
    path_0.lineTo(size.width*0.0034043,size.height*-0.0052029);
    path_0.lineTo(size.width*0.9959574,size.height*-0.0060881);
    path_0.quadraticBezierTo(size.width*1.0027872,size.height*0.6330306,size.width*1.0012766,size.height*0.7342325);
    path_0.cubicTo(size.width*0.9978511,size.height*0.6781731,size.width*1.0147660,size.height*0.8114511,size.width*0.9552766,size.height*0.8222836);
    path_0.quadraticBezierTo(size.width*0.7489574,size.height*0.8233795,size.width*0.1300426,size.height*0.8266672);
    path_0.lineTo(size.width*0.0004043,size.height*1.0079565);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);
  

  // Layer 1
  
  Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    
    canvas.drawPath(path_0, paint_stroke_0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
*/