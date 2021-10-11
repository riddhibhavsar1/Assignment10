import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as eos;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
 late String address;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  late double? lat;
  late double? lon;
  late CameraPosition _kLake;
  List<Marker> _markers = <Marker>[];

  @override
  void initState() {
    super.initState();

    getLocation().then((value) =>
    {
      setState(() {
        lat = value.latitude;
        lon = value.longitude;
        print(value);
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Map screen',
          )),
      body: GoogleMap(
        mapType: MapType.satellite,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set<Marker>.of(_markers),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To My Location!'),
        icon: Icon(Icons.location_on),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    setState(() {
      _markers.add(
          Marker(
              markerId: MarkerId('SomeId'),
              position: LatLng(lat!,lon!),
              infoWindow: InfoWindow(
                  title: '$address'
              )
          )
      );
    });

    _kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(lat!, lon!),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));


  }

  Future<LocationData> getLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        // return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        //return;
      }
    }
    location.onLocationChanged.listen((LocationData value) {


        getAddress(value.latitude!, value.longitude!).then((value) =>
        {
        address= value!

        });

        lat = value.latitude;
        lon = value.longitude;

    });
    _locationData = await location.getLocation();
    return _locationData;
  }

  Future<String?> getAddress(double lat, double lon) async {
    var addresses = await eos.placemarkFromCoordinates(lat, lon);
    return addresses[0].name;
  }
}
