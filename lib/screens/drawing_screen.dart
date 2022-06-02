// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, unused_local_variable, avoid_unnecessary_containers, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../Paint/painter.dart';

class DrawingScreen extends StatefulWidget {
  const DrawingScreen({Key? key}) : super(key: key);

  @override
  State<DrawingScreen> createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  List<Offset> _points = [];
  Color color = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GestureDetector(
          onPanUpdate: (DragUpdateDetails details) {
            setState(() {
              RenderBox object = context.findRenderObject() as RenderBox;
              Offset localPosition =
                  object.globalToLocal(details.globalPosition);

              _points = List.from(_points)..add(localPosition);
            });
          },
          onPanEnd: (DragEndDetails details) {
            _points.add(Offset.infinite);
          },
          child: CustomPaint(
            painter: Painting(points: _points, color: color),
            size: Size.infinite,
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _points.clear();
            },
            child: Icon(Icons.clear_all),
          ),
          FloatingActionButton(
            onPressed: () {
              Alert(
                context: context,
                title: "Change Color",
                buttons: [
                  DialogButton(
                    color: Colors.black,
                    child: Text(
                      "Black",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        color = Colors.black;
                      });
                      Navigator.pop(context);
                    },
                  ),
                  DialogButton(
                    color: Colors.red,
                    child: Text(
                      "Red",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      setState(() {
                        color = Colors.red;
                      });
                      Navigator.pop(context);
                    },
                  ),
                  DialogButton(
                    color: Colors.deepPurple,
                    child: Text(
                      "Purple",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        color=Colors.deepPurple;
                      });
                      Navigator.pop(context);
                    },
                  ),
                  
                ],
              ).show();
            },
            child: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
