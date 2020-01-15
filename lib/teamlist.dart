import 'package:flutter/material.dart';
import 'package:native_application/detailwidget.dart';
import 'package:native_application/team.dart';

class TeamList extends StatelessWidget {
final List<Team> team;
TeamList({Key key, this.team}) : super(key: key);
@override
Widget build(BuildContext context) {
  return ListView.builder(
    itemCount: team == null ? 0 : team.length,
    itemBuilder: (BuildContext context, int index) {
      return
        Card(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailWidget(team[index])),
              );
            },
            child: Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.topLeft,
                  child: Image(
                    image: AssetImage('assets/logos/' + team[index].image),
                    height: 60,
                    width: 60,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(team[index].name, style: Theme.of(context).textTheme.title),
                      Text(team[index].location, style: TextStyle(color: Colors.black.withOpacity(0.8)))
                    ],
                  ),
                )
              ],
            ),
          )
        );
    });
}

}
