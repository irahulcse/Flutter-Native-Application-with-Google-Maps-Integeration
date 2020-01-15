import 'package:flutter/material.dart';
import 'package:native_application/team.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsWidget extends StatefulWidget {
  MapsWidget(this.team);
  final Team team;
  @override
  _MapsWidgetState createState() => _MapsWidgetState();
}

class _MapsWidgetState extends State<MapsWidget> {
  _MapsWidgetState();
  GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.team.name),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.team.lat, widget.team.lng),
          zoom: 11.0,
        ),
      ),
    );
  }
}
