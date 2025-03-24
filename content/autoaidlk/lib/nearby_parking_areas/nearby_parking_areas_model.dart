import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'nearby_parking_areas_widget.dart' show NearbyParkingAreasWidget;
import 'package:flutter/material.dart';

class NearbyParkingAreasModel
    extends FlutterFlowModel<NearbyParkingAreasWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
