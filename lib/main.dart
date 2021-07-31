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
  final List quotes = [
    {
      "quote":
          "It’s your place in the world; it’s your life. Go on and do all you can with it, and make it the life you want to live.",
      "author": "Mae Jemison"
    },
    {
      "quote":
          "You may be disappointed if you fail, but you are doomed if you don’t try.",
      "author": "Beverly Sills"
    },
    {
      "quote":
          "Remember no one can make you feel inferior without your consent.",
      "author": "Eleanor Roosevelt"
    },
    {
      "quote": "Life is what we make it, always has been, always will be.",
      "author": "Grandma Moses"
    },
    {
      "quote":
          "The question isn’t who is going to let me; it’s who is going to stop me.",
      "author": "Ayn Rand"
    },
    {
      "quote":
          "When everything seems to be going against you, remember that the airplane takes off against the wind, not with it.",
      "author": "Henry Ford"
    },
    {
      "quote":
          "It’s not the years in your life that count. It’s the life in your years.",
      "author": "Abraham Lincoln"
    },
    {
      "quote": "Change your thoughts and you change your world.",
      "author": "Norman Vincent Peale"
    },
    {
      "quote":
          "Either write something worth reading or do something worth writing.",
      "author": "Benjamin Franklin"
    },
    {
      "quote": "Nothing is impossible, the word itself says, “I’m possible!”",
      "author": "–Audrey Hepburn"
    },
    {
      "quote": "The only way to do great work is to love what you do.",
      "author": "Steve Jobs"
    },
    {
      "quote": "If you can dream it, you can achieve it.",
      "author": "Zig Ziglar"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: quotes.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildExpandableTile(quotes[index]);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  Widget _buildExpandableTile(item) {
    return ExpansionTile(
      title: Text(
        item['author'],
      ),
      children: <Widget>[
        ListTile(
          title: Text(
            item['quote'],
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}
