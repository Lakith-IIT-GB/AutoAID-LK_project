import '/flutter_flow/flutter_flow_util.dart';
import 'boarding_page_widget.dart' show BoardingPageWidget;
import 'package:flutter/material.dart';

class BoardingPageModel extends FlutterFlowModel<BoardingPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
