import 'package:devfest_app/config/config_bloc.dart';
import 'package:devfest_app/config/config_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:share/share.dart';

class MapPage extends StatefulWidget {
  static const String routeName = "/map";
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController _controller;
  bool isMapCreated = false;
  static final LatLng myLocation = LatLng(37.42796133580664, -122.085749655962);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final CameraPosition _kGooglePlex = CameraPosition(
    target: myLocation,
    zoom: 14.4746,
  );

  Set<Marker> _createMarker() {
    return <Marker>[
      Marker(
          markerId: MarkerId("marker_1"),
          position: myLocation,
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueOrange,
          )),
    ].toSet();
  }

  changeMapMode() {
    if (ConfigBloc().darkModeon) {
      getJsonFile("assets/nightmode.json").then(setMapStyle);
    } else {
      getJsonFile("assets/daymode.json").then(setMapStyle);
    }
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  void setMapStyle(String mapStyle) {
    _controller.setMapStyle(mapStyle);
  }

  @override
  Widget build(BuildContext context) {
    if (isMapCreated) {
      changeMapMode();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Locate Us"),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                ConfigBloc().darkModeon
                    ? FontAwesomeIcons.lightbulb
                    : FontAwesomeIcons.solidLightbulb,
                size: 18,
              ),
              onPressed: () {
                ConfigBloc().dispatch(DarkModeEvent(!ConfigBloc().darkModeon));
              }),
          IconButton(
              icon: Icon(
                Icons.share,
                size: 20,
              ),
              onPressed: () => Share.share(
                  "Download the new DevFest App and share with your tech friends"))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            GoogleMap(
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              myLocationButtonEnabled: true,
              mapToolbarEnabled: true,
              markers: _createMarker(),
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
                isMapCreated = true;
                changeMapMode();
                setState(() {});
              },
            ),
            IgnorePointer(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "Google Office\n",
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text: "Shoreline Amphitheatre, Mountain View, CA",
                            style: Theme.of(context).textTheme.subtitle,
                            children: [])
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
