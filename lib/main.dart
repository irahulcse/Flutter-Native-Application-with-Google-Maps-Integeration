import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:native_application/team.dart';
import 'package:native_application/teamlist.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final String title = 'Premier League Team';
  List data;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: new Container(
          child: new Center(
            child: new FutureBuilder(
              future: DefaultAssetBundle.of(context).loadString('assets/data/team.json'),
              builder: (context, snapshot) {
                List<Team> teams = parseJosn(snapshot.data.toString());
                return teams.length > 0? new TeamList(team: teams): new Center(child: new CircularProgressIndicator());
              },
            )
          ),
        ),
      ),
    );
  }

  // List<Team> parseJosn(String response) {
  //   if(response==null){
  //     return [];
  //   }
  //   final parsed = json.decode(response.toString()).cast<Map<String, dynamic>>();
  //   return parsed.map<Team>((json) => new Team.fromJson(json)).toList();
  // }
  List<Team> parseJosn(String response) {
    if(response==null){
      return [];
    }
  final parsed = jsonDecode(response.toString()).cast<Map<String, dynamic>>();

  return parsed.map<Team>((json) => new Team.fromJson(json)).toList();
  }

}

