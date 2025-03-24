import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'filling_stations_main_widget.dart' show FillingStationsMainWidget;
import 'package:flutter/material.dart';

class FillingStationsMainModel
    extends FlutterFlowModel<FillingStationsMainWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
