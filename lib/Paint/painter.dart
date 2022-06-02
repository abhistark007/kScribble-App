import 'package:flutter/material.dart';


class Painting extends CustomPainter{
  final List<Offset> points;
  Painting({
    required this.points
  });


  @override
  void paint(Canvas canvas, Size size) {
    Paint paint =Paint()
    ..color=Colors.black
    ..strokeCap=StrokeCap.round
    ..strokeWidth=5.0;


    for(int i=0;i<points.length-1;i++){
      // ignore: unnecessary_null_comparison
      if(points[i]!=null && points[i+1]!=null && points[i]!=Offset.infinite){
        canvas.drawLine(points[i], points[i+1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(Painting oldDelegate)=> oldDelegate.points!=points;

}