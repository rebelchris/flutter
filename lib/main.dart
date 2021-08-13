import 'package:flutter/material.dart';

void main() async {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Offset _offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter 3D Card'),
      ),
      body: Center(
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001) // perspective
            ..rotateX(0.01 * _offset.dy) // changed
            ..rotateY(-0.01 * _offset.dx), // changed
          alignment: FractionalOffset.center,
          child: GestureDetector(
            // new
            onPanUpdate: (details) => setState(() => _offset += details.delta),
            onDoubleTap: () => setState(() => _offset = Offset.zero),
            child: FractionallySizedBox(
              widthFactor: 0.7,
              heightFactor: 0.9,
              child: Image(image: AssetImage('DailyDevTips.png')),
            ),
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Flutter 3D Card'), // changed
  //     ),
  //     body: Center(
  //       child: Transform(
  //         transform: Matrix4.identity()
  //           ..setEntry(3, 2, 0.001) // perspective
  //           ..rotateX(0.01 * _offset.dy) // changed
  //           ..rotateY(-0.01 * _offset.dx), // changed
  //         alignment: FractionalOffset.center,
  //         child: GestureDetector(
  //           // new
  //           onPanUpdate: (details) => setState(() => _offset += details.delta),
  //           onDoubleTap: () => setState(() => _offset = Offset.zero),
  //           child: FractionallySizedBox(
  //             widthFactor: 0.7,
  //             heightFactor: 0.9,
  //             child: Image(image: AssetImage('DailyDevTips.png')),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
