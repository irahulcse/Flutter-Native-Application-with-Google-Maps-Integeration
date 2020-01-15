import 'package:flutter/material.dart';
import 'package:native_application/mapswidget.dart';
import 'package:native_application/team.dart';


class DetailWidget extends StatefulWidget {
  DetailWidget(this.team);

  final Team team;

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}
class _DetailWidgetState extends State<DetailWidget> {
  _DetailWidgetState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.team.name),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Card(
            child: Container(
                padding: EdgeInsets.all(10.0),
                width: 440,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Image(image: AssetImage('assets/logos/' + widget.team.image))
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          Text('City:', style: TextStyle(color: Colors.black.withOpacity(0.8))),
                          Text(widget.team.location, style: Theme.of(context).textTheme.title)
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          Text('Stadium:', style: TextStyle(color: Colors.black.withOpacity(0.8))),
                          Text(widget.team.stadium, style: Theme.of(context).textTheme.title)
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          Text('Stadium Capacity:', style: TextStyle(color: Colors.black.withOpacity(0.8))),
                          Text(widget.team.capacity.toString(), style: Theme.of(context).textTheme.title)
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          Text('Manager:', style: TextStyle(color: Colors.black.withOpacity(0.8))),
                          Text(widget.team.manager, style: Theme.of(context).textTheme.title)
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          Text('Captain:', style: TextStyle(color: Colors.black.withOpacity(0.8))),
                          Text(widget.team.captain, style: Theme.of(context).textTheme.title)
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MapsWidget(widget.team)));
                        },
                        color: Colors.blue,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(10.0),
                        child: Column( // Replace with a Row for horizontal icon + text
                          children: <Widget>[
                            Icon(Icons.map),
                            Text("Show Maps")
                          ],
                        ),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                        ),
                      ),
                    )
                  ],
                )
            )
          ),
        ),
      ),
    );
  }
}