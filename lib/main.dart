import 'package:VirtualFlightThrottle/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'page/controller/page_main_panel.dart';
import 'page/direction_state.dart';
import 'page/layout/builder/page_layout_builder.dart';
import 'page/layout/list/page_layout_list.dart';
import 'page/layout/store/page_layout_store.dart';
import 'page/network/page_network.dart';
import 'page/settings/page_settings.dart';

class VirtualThrottleApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "VirtualThrottle",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),

      // TODO: i8n initialize
      // localizationsDelegates: [S.delegate],
      // supportedLocales: S.delegate.supportedLocales,
      // localeResolutionCallback: S.delegate.resolution(fallback: Locale('en')),

      initialRoute: "/",
      routes: {
        Routes.PAGE_MAIN_PANEL: (context) => PageMainPanel(),
        Routes.PAGE_LAYOUT_LIST: (context) => PageLayoutList(),
        Routes.PAGE_LAYOUT_BUILDER: (context) => PageLayoutBuilder(),
        Routes.PAGE_LAYOUT_STORE: (context) => PageLayoutStore(),
        Routes.PAGE_NETWORK: (context) => PageNetwork(),
        Routes.PAGE_SETTING: (context) => PageSettings(),
      },
      navigatorObservers: [routeObserver],
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIOverlays([]);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(VirtualThrottleApp());
}
