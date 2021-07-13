import 'package:flutter/material.dart';

void main() async {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, initialRoute: '/', routes: {
      '/': (context) => RouteOne(),
      '/detail': (context) => RouteTwo(item: ''),
    }),
  );
}

class RouteOne extends StatelessWidget {
  final list = List.generate(20, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen one ☝️'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(list[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RouteTwo(
                      item: list[index],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class RouteTwo extends StatelessWidget {
  final String item;

  RouteTwo({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen two ✌️'),
      ),
      body: Center(
          child: Column(
        children: [
          Spacer(),
          Text(
            'You clicked on: $item',
            style: TextStyle(fontSize: 32),
          ),
          Spacer(),
          ElevatedButton(
            // Within the `FirstScreen` widget
            onPressed: () {
              // Navigate to the second screen using a named route.
              Navigator.pop(context);
            },
            child: Text('Go back'),
          ),
          Spacer(),
        ],
      )),
    );
  }
}
