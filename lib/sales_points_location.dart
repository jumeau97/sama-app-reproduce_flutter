import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SalesPointsMaps extends StatefulWidget {
  const SalesPointsMaps({super.key});

  @override
  State<SalesPointsMaps> createState() => _SalesPointsMapsState();
}

class _SalesPointsMapsState extends State<SalesPointsMaps> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(12.641121910414894, -8.022512245165704),
    zoom: 14.4746,
  );

  List<Marker> _marker = [];
  List<Marker> mylist = const [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(12.641121910414894, -8.022512245165704),
      infoWindow: InfoWindow(
        title: 'Siège sama',
      ),
    ),
        Marker(
      markerId: MarkerId('2'),
      position: LatLng(12.640975347616717, -8.024121570548791),
      infoWindow: InfoWindow(
        title: 'Siège ',
      ),
    )
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(mylist);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(_marker),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
