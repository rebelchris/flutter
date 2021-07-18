import 'package:flutter/material.dart';
import 'package:flutter_app/screens/detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Show>> shows;

  @override
  void initState() {
    super.initState();
    shows = fetchShows();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Anime app')),
      body: Center(
        child: FutureBuilder(
          builder: (context, AsyncSnapshot<List<Show>> snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage('${snapshot.data![index].imageUrl}'),
                      ),
                      title: Text('${snapshot.data![index].title}'),
                      subtitle: Text('Score: ${snapshot.data![index].score}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                                item: snapshot.data![index].malId,
                                title: snapshot.data![index].title),
                          ),
                        );
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Something went wrong :('));
            }

            return CircularProgressIndicator();
          },
          future: shows,
        ),
      ),
    );
  }
}

class Show {
  final int malId;
  final String title;
  final String imageUrl;
  final double score;

  Show({
    required this.malId,
    required this.title,
    required this.imageUrl,
    required this.score,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      malId: json['mal_id'],
      title: json['title'],
      imageUrl: json['image_url'],
      score: json['score'],
    );
  }
}

Future<List<Show>> fetchShows() async {
  final response =
      await http.get(Uri.parse('https://api.jikan.moe/v3/top/anime/1'));

  if (response.statusCode == 200) {
    var topShowsJson = jsonDecode(response.body)['top'] as List;
    return topShowsJson.map((show) => Show.fromJson(show)).toList();
  } else {
    throw Exception('Failed to load shows');
  }
}
