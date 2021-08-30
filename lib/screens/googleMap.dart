import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMAp extends StatefulWidget {
  const GoogleMAp({Key key}) : super(key: key);

  @override
  _GoogleMApState createState() => _GoogleMApState();
}

class _GoogleMApState extends State<GoogleMAp> {
  Set<Marker> markers = {};

  ///////////////////////////////////////// change marker  to my assets image ///////////////////////
  BitmapDescriptor mapDecript;
  void setCustomMapMarker() async {
    mapDecript = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/splash_1.png",
    );
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      markers.add(Marker(
          icon: mapDecript,
          markerId: MarkerId('id-1'),
          position: LatLng(22.5448131, 88.3403691),
          infoWindow: InfoWindow(
              title: 'Vectoria Memorial', snippet: 'A Historial Place')));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setCustomMapMarker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          myLocationEnabled: true,
          markers: markers,
          onMapCreated: onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(22.5448131, 88.3403691),
            zoom: 15,
          )),
    );
  }
}
