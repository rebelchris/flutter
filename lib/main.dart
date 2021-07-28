import 'package:flutter/material.dart';

void main() async {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.pink, Colors.green],
  ).createShader(
    Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
  );

  final gradient = LinearGradient(
    colors: [Colors.pink, Colors.green],
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Hello Gradients!',
            style: new TextStyle(
                fontSize: 60.0,
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader = linearGradient),
          ),
        ),
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return gradient.createShader(Offset.zero & bounds.size);
          },
          child: Text(
            'Hello Gradients!',
            style: new TextStyle(
              color: Colors.white,
              fontSize: 60.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
