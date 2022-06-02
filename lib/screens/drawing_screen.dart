// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, unused_local_variable, avoid_unnecessary_containers

import 'package:flutter/material.dart';

import '../Paint/painter.dart';

class DrawingScreen extends StatefulWidget {
  const DrawingScreen({Key? key}) : super(key: key);

  @override
  State<DrawingScreen> createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  List<Offset> _points=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GestureDetector(
          onPanUpdate: (DragUpdateDetails details){
            setState(() {
              RenderBox object=context.findRenderObject() as RenderBox;
              Offset localPosition= object.globalToLocal(details.globalPosition);

              _points=List.from(_points)..add(localPosition);
            });
          },
          onPanEnd: (DragEndDetails details){
            _points.add(null as Offset);
          },
          child: CustomPaint(
            painter: Painting(points: _points),
            size: Size.infinite,
          ),
        ),
      ),
    );
  }
}