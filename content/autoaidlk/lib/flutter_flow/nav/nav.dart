import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const HomepageWidget() : const BoardingPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? const HomepageWidget()
              : const BoardingPageWidget(),
        ),
        FFRoute(
          name: 'Boarding_page',
          path: '/boardingPage',
          builder: (context, params) => const BoardingPageWidget(),
        ),
        FFRoute(
          name: 'Homepage',
          path: '/homepage',
          builder: (context, params) => const HomepageWidget(),
        ),
        FFRoute(
          name: 'Authentication',
          path: '/authentication',
          builder: (context, params) => const AuthenticationWidget(),
        ),
        FFRoute(
          name: 'User_info1',
          path: '/userInfo1',
          builder: (context, params) => const UserInfo1Widget(),
        ),
        FFRoute(
          name: 'User_info2',
          path: '/userInfo2',
          builder: (context, params) => const UserInfo2Widget(),
        ),
        FFRoute(
          name: 'Mechanic_Appointment',
          path: '/mechanicAppointment',
          builder: (context, params) => const MechanicAppointmentWidget(),
        ),
        FFRoute(
          name: 'Mechanic_1',
          path: '/mechanic1',
          builder: (context, params) => const Mechanic1Widget(),
        ),
        FFRoute(
          name: 'Mechanic_2',
          path: '/mechanic2',
          builder: (context, params) => const Mechanic2Widget(),
        ),
        FFRoute(
          name: 'Mechanic_3',
          path: '/mechanic3',
          builder: (context, params) => const Mechanic3Widget(),
        ),
        FFRoute(
          name: 'Mechanic_4',
          path: '/mechanic4',
          builder: (context, params) => const Mechanic4Widget(),
        ),
        FFRoute(
          name: 'Mechanic_5',
          path: '/mechanic5',
          builder: (context, params) => const Mechanic5Widget(),
        ),
        FFRoute(
          name: 'Mechanic_Main',
          path: '/mechanicMain',
          builder: (context, params) => const MechanicMainWidget(),
        ),
        FFRoute(
          name: 'Service_Stations1',
          path: '/serviceStations1',
          builder: (context, params) => const ServiceStations1Widget(),
        ),
        FFRoute(
          name: 'Service_Stations2',
          path: '/serviceStations2',
          builder: (context, params) => const ServiceStations2Widget(),
        ),
        FFRoute(
          name: 'Service_Stations3',
          path: '/serviceStations3',
          builder: (context, params) => const ServiceStations3Widget(),
        ),
        FFRoute(
          name: 'Service_Stations4',
          path: '/serviceStations4',
          builder: (context, params) => const ServiceStations4Widget(),
        ),
        FFRoute(
          name: 'Service_Stations5',
          path: '/serviceStations5',
          builder: (context, params) => const ServiceStations5Widget(),
        ),
        FFRoute(
          name: 'Service_Stations6',
          path: '/serviceStations6',
          builder: (context, params) => const ServiceStations6Widget(),
        ),
        FFRoute(
          name: 'Repair_Stations1',
          path: '/repairStations1',
          builder: (context, params) => const RepairStations1Widget(),
        ),
        FFRoute(
          name: 'Repair_Stations2',
          path: '/repairStations2',
          builder: (context, params) => const RepairStations2Widget(),
        ),
        FFRoute(
          name: 'Repair_Stations3',
          path: '/repairStations3',
          builder: (context, params) => const RepairStations3Widget(),
        ),
        FFRoute(
          name: 'Repair_Stations4',
          path: '/repairStations4',
          builder: (context, params) => const RepairStations4Widget(),
        ),
        FFRoute(
          name: 'Repair_Stations5',
          path: '/repairStations5',
          builder: (context, params) => const RepairStations5Widget(),
        ),
        FFRoute(
          name: 'Repair_Stations6',
          path: '/repairStations6',
          builder: (context, params) => const RepairStations6Widget(),
        ),
        FFRoute(
          name: 'Service_Stations_Appointment',
          path: '/serviceStationsAppointment',
          builder: (context, params) => const ServiceStationsAppointmentWidget(),
        ),
        FFRoute(
          name: 'Repair_Stations_Appointment',
          path: '/repairStationsAppointment',
          builder: (context, params) => const RepairStationsAppointmentWidget(),
        ),
        FFRoute(
          name: 'Service_Stations_Main',
          path: '/serviceStationsMain',
          builder: (context, params) => const ServiceStationsMainWidget(),
        ),
        FFRoute(
          name: 'Repair_Stations_Main',
          path: '/repairStationsMain',
          builder: (context, params) => const RepairStationsMainWidget(),
        ),
        FFRoute(
          name: 'Filling_Stations_Main',
          path: '/fillingStationsMain',
          builder: (context, params) => const FillingStationsMainWidget(),
        ),
        FFRoute(
          name: 'Emergency_Main',
          path: '/emergencyMain',
          builder: (context, params) => const EmergencyMainWidget(),
        ),
        FFRoute(
          name: 'Breakdown_Services_Main',
          path: '/breakdownServicesMain',
          builder: (context, params) => const BreakdownServicesMainWidget(),
        ),
        FFRoute(
          name: 'Nearby_Parking_Areas',
          path: '/nearbyParkingAreas',
          builder: (context, params) => const NearbyParkingAreasWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/boardingPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
