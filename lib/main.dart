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
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackbar = SnackBar(
            content: const Text('Successfully modified row x'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Add your undo code here
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        },
        child: const Text('Open the snackbar'),
      ),
    );
  }
}
