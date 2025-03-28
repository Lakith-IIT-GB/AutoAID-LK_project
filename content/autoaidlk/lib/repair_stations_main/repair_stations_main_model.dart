import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'repair_stations_main_widget.dart' show RepairStationsMainWidget;
import 'package:flutter/material.dart';

class RepairStationsMainModel
    extends FlutterFlowModel<RepairStationsMainWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
